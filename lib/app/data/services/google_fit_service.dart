import 'package:flutter/foundation.dart';
import 'package:health/health.dart';

class GoogleFitService {
  static final GoogleFitService _instance = GoogleFitService._internal();

  factory GoogleFitService() => _instance;

  GoogleFitService._internal();

  final Health _health = Health();

  final List<HealthDataType> types = [HealthDataType.STEPS, HealthDataType.ACTIVE_ENERGY_BURNED];

  final List<HealthDataAccess> permissions = [HealthDataAccess.READ, HealthDataAccess.READ];

  Future<void> configure() async {
    await _health.configure();
  }

  Future<bool> requestAuthorization() async {
    bool? hasPermissions = await _health.hasPermissions(types, permissions: permissions);

    if (hasPermissions == false) {
      bool authorized = await _health.requestAuthorization(types, permissions: permissions);
      return authorized;
    }

    return hasPermissions ?? false;
  }

  Future<int> getTodaySteps() async {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    try {
      int? steps = await _health.getTotalStepsInInterval(midnight, now);
      return steps ?? 0;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching steps: $e');
      }
      return 0;
    }
  }

  Future<double> getTodayCalories() async {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    try {
      List<HealthDataPoint> healthData = await _health.getHealthDataFromTypes(
        types: [HealthDataType.ACTIVE_ENERGY_BURNED],
        startTime: midnight,
        endTime: now,
      );

      double totalCalories = 0;
      for (var data in healthData) {
        if (data.value is NumericHealthValue) {
          totalCalories += (data.value as NumericHealthValue).numericValue;
        }
      }

      return totalCalories;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching calories: $e');
      }
      return 0.0;
    }
  }

  Future<Map<String, dynamic>> getFitnessData() async {
    final steps = await getTodaySteps();
    final calories = await getTodayCalories();

    return {'steps': steps, 'calories': calories};
  }
}
