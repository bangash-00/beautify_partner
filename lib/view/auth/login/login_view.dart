import 'package:beautify_partner/constants/app_assets.dart';
import 'package:beautify_partner/routes/app_pages.dart';
import 'package:beautify_partner/widgets/app_password_textfield.dart';
import 'package:beautify_partner/widgets/app_simple_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../widgets/app_button.dart';
import 'login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    Text(
                      "Welcome back,",
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Glad to meet you again!, please login to use the app.",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black54),
                    ),
                    const SizedBox(height: 32),

                    AppSimpleTextField(
                      hintText: "Email",
                      icon: SvgPicture.asset(AppAssets.svgEmailIcon, height: 20),
                      controller: controller.emailController,
                      focusNode: controller.emailFocus,
                      isFocused: controller.isEmailFocused,
                    ),
                    const SizedBox(height: 16),

                    AppPasswordTextField(
                      hintText: "Password",
                      leadingIcon: Icon(Icons.lock),
                      controller: controller.passwordController,
                      focusNode: controller.passwordFocus,
                      isFocused: controller.isPasswordFocused,
                      isObscure: controller.isObscurePassword,
                    ),
                    const SizedBox(height: 8),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: Color(0xFF146C76),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    AppButton.primary(
                      text: "Sign In",
                      isLoading: controller.isLoading,
                      onPressed: controller.login,
                      fullWidth: true,
                    ),
                    const SizedBox(height: 20),

                    Row(
                      children: const [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("or"),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 20),

                    AppButton.white(
                      text: "Sign In with Google",
                      onPressed: () {
                        controller.signInWithGoogle();
                      },
                      isLoading: false.obs,
                      fullWidth: true,
                      leading: Image.asset(
                        AppAssets.googleIcon,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const Spacer(),

                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.SIGNUP);
                          },
                          child: const Text.rich(
                            TextSpan(
                              text: "Don’t have an account? ",
                              style: TextStyle(color: Colors.black),

                              children: [
                                TextSpan(
                                  text: "Join Now",
                                  style: TextStyle(
                                    color: Color(0xFF146C76),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
