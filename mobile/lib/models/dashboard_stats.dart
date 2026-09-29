class DashboardStats {
  final int totalMedia;
  final int totalDrafts;
  final int scheduledCount;
  final int publishedCount;
  final int failedCount;

  const DashboardStats({
    required this.totalMedia,
    required this.totalDrafts,
    required this.scheduledCount,
    required this.publishedCount,
    required this.failedCount,
  });

  factory DashboardStats.initial() {
    return const DashboardStats(
      totalMedia: 0,
      totalDrafts: 0,
      scheduledCount: 0,
      publishedCount: 0,
      failedCount: 0,
    );
  }
}
