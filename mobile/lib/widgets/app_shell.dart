import 'package:flutter/material.dart';
import '../features/dashboard/dashboard_controller.dart';
import '../features/dashboard/dashboard_screen.dart';
import '../repositories/dashboard_repository.dart';
import 'stage_placeholder.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;
  late final DashboardController _dashboardController;

  @override
  void initState() {
    super.initState();
    _dashboardController = DashboardController(LocalDashboardRepository());
  }

  @override
  void dispose() {
    _dashboardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      DashboardScreen(controller: _dashboardController),
      const StagePlaceholder(
        title: 'Media Library',
        description: 'Fitur galeri dan impor media lokal akan hadir pada Checkpoint 1C.',
      ),
      const StagePlaceholder(
        title: 'Composer & Draft',
        description: 'Fitur pembuat konten dan pengelola draft akan hadir pada Checkpoint 1E.',
      ),
      const StagePlaceholder(
        title: 'Akun Sosial',
        description: 'Fitur pengelolaan akun platform sosial akan hadir pada FASE 2.',
      ),
      const StagePlaceholder(
        title: 'Pengaturan',
        description: 'Fitur konfigurasi lokal aplikasi akan hadir pada checkpoint mendatang.',
      ),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.photo_library_outlined),
            selectedIcon: Icon(Icons.photo_library),
            label: 'Media',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_box_outlined),
            selectedIcon: Icon(Icons.add_box),
            label: 'Composer',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_tree_outlined),
            selectedIcon: Icon(Icons.account_tree),
            label: 'Akun',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }
}
