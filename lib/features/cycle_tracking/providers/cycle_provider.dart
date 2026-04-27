import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/isar/isar_service.dart';
import '../../../../core/isar/schemas/cycle_entry.dart';
import '../../auth/data/auth_providers.dart';

/// Provider for the Isar database instance.
final isarProvider = FutureProvider<Isar>((ref) async {
  return await IsarService().db;
});

const MIN_CYCLE_GAP = 15;

final cycleMigrationProvider = FutureProvider<void>((ref) async {
  final isar = await ref.watch(isarProvider.future);
  final currentUserId = ref.watch(currentUserIdProvider);
  
  await isar.writeTxn(() async {
    final cycles = await isar.cycleEntrys
        .filter()
        .userIdEqualTo(currentUserId)
        .sortByStartDate()
        .findAll();
        
    if (cycles.isEmpty) return;
    
    var current = cycles.first;
    for (int i = 1; i < cycles.length; i++) {
      final next = cycles[i];

      if (next.startDate.difference(current.startDate).inDays < MIN_CYCLE_GAP) {
        // merge
        current.endDate = next.endDate ?? next.startDate;
        current.duration = current.endDate!.difference(current.startDate).inDays + 1;
        await isar.cycleEntrys.delete(next.id);
        await isar.cycleEntrys.put(current);
      } else {
        current = next;
      }
    }
  });
});

/// Reactive stream of cycle entries for the current user.
/// This automatically updates the UI whenever the database changes.
final cycleListProvider = StreamProvider<List<CycleEntry>>((ref) async* {
  final currentUserId = ref.watch(currentUserIdProvider);
  
  // Wait for migration to finish
  await ref.watch(cycleMigrationProvider.future);

  final isarAsync = ref.watch(isarProvider);
  final isar = isarAsync.valueOrNull;
  
  if (isar == null) {
    yield [];
    return;
  }

  // Watch the collection for changes filtered by the current user
  yield* isar.cycleEntrys
      .filter()
      .userIdEqualTo(currentUserId)
      .sortByStartDateDesc()
      .watch(fireImmediately: true);
});

/// Provider for cycle tracking actions (like adding a new entry).
final cycleActionsProvider = Provider((ref) => CycleActions(ref));

class CycleActions {
  final Ref _ref;
  CycleActions(this._ref);

  Future<CycleEntry?> getLastCycle(Isar isar, String userId) async {
    return await isar.cycleEntrys
        .filter()
        .userIdEqualTo(userId)
        .sortByStartDateDesc()
        .findFirst();
  }

  Future<void> addCycleDate(DateTime rawDate) async {
    final currentUserId = _ref.read(currentUserIdProvider);
    final isar = await _ref.read(isarProvider.future);
    
    final date = DateTime(rawDate.year, rawDate.month, rawDate.day);
    
    final lastCycle = await getLastCycle(isar, currentUserId);

    if (lastCycle != null) {
      final gap = date.difference(lastCycle.startDate).inDays;

      if (gap >= 0 && gap < MIN_CYCLE_GAP) {
        // Extend existing cycle
        lastCycle.endDate = date;
        lastCycle.duration = gap + 1;

        await isar.writeTxn(() async {
          await isar.cycleEntrys.put(lastCycle);
        });

        return;
      } else if (gap < 0) {
        // Selected date is before the most recent cycle start date.
        // For simplicity, we just create a new cycle (or it could be handled by migration next startup)
        // But the prompt's condition "gap >= MIN_CYCLE_GAP" to create new cycle implies gap >= 15.
        // If gap < 0, maybe throw? 
        // "Date already part of existing cycle" if date is within the cycle?
        if (date.isAfter(lastCycle.startDate.subtract(const Duration(days: 1))) && 
            date.isBefore(lastCycle.endDate ?? lastCycle.startDate.add(const Duration(days: 1)))) {
           throw Exception("Date already part of existing cycle");
        }
      }
    }

    // Create NEW cycle
    if (lastCycle == null || date.difference(lastCycle.startDate).inDays >= MIN_CYCLE_GAP || date.difference(lastCycle.startDate).inDays < 0) {
      final newCycle = CycleEntry()
        ..userId = currentUserId
        ..startDate = date;

      await isar.writeTxn(() async {
        if (lastCycle != null && lastCycle.endDate == null && date.difference(lastCycle.startDate).inDays >= MIN_CYCLE_GAP) {
            // Close old ongoing cycle if it was left open
            lastCycle.endDate = lastCycle.startDate;
            lastCycle.duration = 1;
            await isar.cycleEntrys.put(lastCycle);
        }
        await isar.cycleEntrys.put(newCycle);
      });
    }
  }
}
