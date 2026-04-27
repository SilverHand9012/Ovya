import 'package:isar/isar.dart';

part 'sync_queue.g.dart';

/// Isar collection schema for offline sync queue items.
@collection
class SyncQueue {
  Id id = Isar.autoIncrement;

  @Index()
  late String userId;

  late String action;
  late String payload;

  @Index()
  late DateTime createdAt;

  late int retryCount;
  late bool isSynced;
}
