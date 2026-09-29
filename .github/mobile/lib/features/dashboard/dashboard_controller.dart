import 'package:flutter/material.dart';
import '../../models/dashboard_stats.dart';
import '../../repositories/dashboard_repository.dart';

class DashboardController extends ChangeNotifier {
  final DashboardRepository _repository;

  DashboardController(this._repository);

  DashboardStats _stats = DashboardStats.initial();
  bool _isLoading = false;

  DashboardStats get stats => _stats;
  bool get isLoading => _isLoading;

  Future<void> loadStats() async {
    _isLoading = true;
    notifyListeners();

    try {
      _stats = await _repository.getStats();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
