import 'package:isar/isar.dart';

part 'insight_cache.g.dart';

/// Isar collection schema for cached AI insights.
@collection
class InsightCache {
  Id id = Isar.autoIncrement;

  late String insightText;

  @Index()
  late DateTime generatedAt;

  DateTime? expiresAt;
  late bool isFromAi;
}
