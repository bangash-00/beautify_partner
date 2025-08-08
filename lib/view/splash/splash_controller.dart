import 'package:beautify_partner/configs/get_it.dart';
import 'package:beautify_partner/routes/app_pages.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getIt<LoggerService>().info('SplashController: Initializing splash screen');
    _startDelay();
  }

  void _startDelay() {
    getIt<LoggerService>().info('SplashController: Starting delay for splash screen');
    Timer(const Duration(seconds: 3), _goToNext);
  }

  void _goToNext() {
    Get.offAllNamed(Routes.ONBOARDING);
  }
}
