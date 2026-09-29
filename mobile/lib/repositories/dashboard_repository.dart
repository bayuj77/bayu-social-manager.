import '../models/dashboard_stats.dart';

abstract class DashboardRepository {
  Future<DashboardStats> getStats();
}

class LocalDashboardRepository implements DashboardRepository {
  @override
  Future<DashboardStats> getStats() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return DashboardStats.initial();
  }
}
