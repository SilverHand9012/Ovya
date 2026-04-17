/// Abstract repository for report generation operations.
abstract class ReportRepository {
  Future<dynamic> generateReport();
  Future<List<dynamic>> getReportHistory();
}
