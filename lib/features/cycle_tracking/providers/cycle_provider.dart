import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../../../../core/isar/isar_service.dart';
import '../../../../core/isar/schemas/cycle_entry.dart';

final cycleProvider = StateNotifierProvider<CycleNotifier, List<CycleEntry>>((ref) {
  return CycleNotifier();
});

class CycleNotifier extends StateNotifier<List<CycleEntry>> {
  CycleNotifier() : super([]) {
    _loadCycles();
  }

  Future<void> _loadCycles() async {
    final isar = await IsarService().db;
    final cycles = await isar.cycleEntrys.where().sortByStartDateDesc().findAll();
    state = cycles;
  }

  Future<void> addCycleDate(DateTime date) async {
    final isar = await IsarService().db;
    final entry = CycleEntry()
      ..startDate = DateTime(date.year, date.month, date.day);
      
    await isar.writeTxn(() async {
      await isar.cycleEntrys.put(entry);
    });
    
    await _loadCycles();
  }
}
