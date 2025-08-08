import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../widgets/app_button.dart';
import 'onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> pages = [
      {
        "image": AppAssets.onboard1,
        "title": "Best Stylist For You",
        "subtitle": "Styling your appearance according to your lifestyle",
      },
      {
        "image": AppAssets.onboard2,
        "title": "Meet Our Specialists",
        "subtitle": "There are many best stylists from all the best salons ever",
      },
      {
        "image": AppAssets.onboard3,
        "title": "Find The Best Service",
        "subtitle": "There are various services from the best salons that have become our partners",
      },
      {
        "image": AppAssets.onboard4,
        "title": "Let’s Join with Us",
        "subtitle": "Find and book Beauty, Salon, Barber and Spa services anywhere, anytime",
      },
    ];

    return Scaffold(
      body: Obx(() {
        final page = pages[controller.currentPage.value];
        final isLastPage = controller.currentPage.value == pages.length - 1;

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.1, 0), // slight right
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: Stack(
            key: ValueKey(page["image"]),
            fit: StackFit.expand,
            children: [
              // Background Image
              Image.asset(
                page["image"]!,
                fit: BoxFit.cover,
              ),

              // Gradient Overlay
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black54,
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.5],
                  ),
                ),
              ),

              SafeArea(
                child: Column(
                  children: [
                    const Spacer(),

                    // Text Content
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          Text(
                            page["title"]!,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            page["subtitle"]!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: [
                          if (isLastPage) ...[
                            AppButton.white(
                              text: "Join with Google",
                              onPressed: () {
                                controller.signInWithGoogle();
                              },
                              fullWidth: true,
                              leading: Image.asset(
                                AppAssets.googleIcon,
                                height: 20,
                                width: 20,
                              ),
                            ),
                            const SizedBox(height: 12),
                            AppButton.primary(
                              text: "Join with Email",
                              onPressed: controller.skipToSignIn,
                              fullWidth: true,
                              leading: const Icon(Icons.email, color: Colors.white),
                            ),
                          ] else ...[
                            AppButton.primary(
                              text: "Next",
                              onPressed: controller.nextPage,
                              fullWidth: true,
                            ),
                          ],
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Custom Indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        pages.length,
                            (index) {
                          final isActive = controller.currentPage.value == index;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 8,
                            width: isActive ? 24 : 8,
                            decoration: BoxDecoration(
                              color: isActive ? AppColors.accent : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 12),

                    TextButton(
                      onPressed: controller.skipToSignIn,
                      child: const Text.rich(
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: Colors.white),
                          children: [
                            TextSpan(
                              text: "Sign In",
                              style: TextStyle(color: AppColors.accent),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
