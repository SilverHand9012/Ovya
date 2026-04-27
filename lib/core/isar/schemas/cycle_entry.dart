import 'package:isar/isar.dart';

part 'cycle_entry.g.dart';

/// Isar collection schema for cycle tracking entries.
@collection
class CycleEntry {
  Id id = Isar.autoIncrement;

  @Index()
  late String userId;

  @Index()
  late DateTime startDate;

  DateTime? endDate;
  int? duration;
  String? notes;
}
