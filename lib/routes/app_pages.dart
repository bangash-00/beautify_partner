import 'package:beautify_partner/view/auth/login/login_view.dart';
import 'package:beautify_partner/view/home/home_view.dart';
import 'package:get/get.dart';

import '../view/auth/signup/signup_controller.dart';
import '../view/auth/signup/signup_view.dart';
import '../view/onBoarding/onboarding_controller.dart';
import '../view/onBoarding/onboarding_view.dart';
import '../view/splash/splash_controller.dart';
import '../view/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SplashController>(() => SplashController());
      }),
    ),

    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnboardingView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => OnboardingController());
      }),
    ),

    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: BindingsBuilder(() {
        // Add HomeController binding here if needed
      }),
    ),

    // login
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: BindingsBuilder(() {
        // Add LoginController binding here if needed
      }),
    ),

    // signup
    GetPage(
      name: Routes.SIGNUP,
      page: () =>  SignUpView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => SignUpController());
      }),
    )
  ];
}
