import 'package:fitness_tracker/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      try {
        if (kDebugMode) {
          print('Attempting to navigate to home...');
        }
        Get.offAllNamed(Routes.HOME);
        if (kDebugMode) {
          print('Navigation completed');
        }
      } catch (e) {
        if (kDebugMode) {
          print('Navigation error: $e');
        }
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
