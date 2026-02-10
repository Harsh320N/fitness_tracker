import 'package:animate_do/animate_do.dart';
import 'package:fitness_tracker/app/core/values/app_images.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Center(
              child: SlideInDown(
                duration: const Duration(milliseconds: 800),
                delay: const Duration(milliseconds: 200),
                from: 100,
                child: FadeIn(
                  duration: const Duration(milliseconds: 800),
                  delay: const Duration(milliseconds: 200),
                  child: Image.asset(
                    AppImages.pin,
                  ),
                ),
              ),
            ),
            Center(
              child: SlideInUp(
                duration: const Duration(milliseconds: 900),
                delay: const Duration(milliseconds: 700),
                from: 100,
                child: FadeIn(
                  duration: const Duration(milliseconds: 900),
                  delay: const Duration(milliseconds: 700),
                  child: Image.asset(
                    isDark ? AppImages.logoLight : AppImages.logoDark,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}