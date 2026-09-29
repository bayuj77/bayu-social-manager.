import 'package:flutter/material.dart';
import 'dashboard_controller.dart';
import '../../widgets/stat_card.dart';

class DashboardScreen extends StatefulWidget {
  final DashboardController controller;

  const DashboardScreen({super.key, required this.controller});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    widget.controller.loadStats();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: ListenableBuilder(
        listenable: widget.controller,
        builder: (context, _) {
          if (widget.controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final stats = widget.controller.stats;

          return RefreshIndicator(
            onRefresh: () => widget.controller.loadStats(),
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Card(
                  color: theme.colorScheme.tertiaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: theme.colorScheme.onTertiaryContainer,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Mode FASE 1: Autentikasi belum diaktifkan. Menggunakan statistik data lokal.',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onTertiaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                StatCard(
                  title: 'Total Media',
                  value: stats.totalMedia.toString(),
                  icon: Icons.perm_media,
                ),
                const SizedBox(height: 12),
                StatCard(
                  title: 'Draft Konten',
                  value: stats.totalDrafts.toString(),
                  icon: Icons.drafts,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: StatCard(
                        title: 'Terjadwal',
                        value: stats.scheduledCount.toString(),
                        icon: Icons.schedule,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: StatCard(
                        title: 'Tergugah',
                        value: stats.publishedCount.toString(),
                        icon: Icons.check_circle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
