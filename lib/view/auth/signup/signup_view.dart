import 'package:beautify_partner/constants/app_assets.dart';
import 'package:beautify_partner/widgets/app_password_textfield.dart';
import 'package:beautify_partner/widgets/app_simple_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../widgets/app_button.dart';
import 'signup_controller.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final controller = Get.put(SignUpController());

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
                minHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    Text(
                      "Create an account,",
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Please type full information below and we can create your account",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black54),
                    ),
                    const SizedBox(height: 32),

                    // Name
                    AppSimpleTextField(
                      hintText: "Name",
                      icon: Icon(Icons.person, size: 20),
                      controller: controller.nameController,
                      focusNode: controller.nameFocus,
                      isFocused: controller.isNameFocused,
                    ),
                    const SizedBox(height: 16),

                    // Email
                    AppSimpleTextField(
                      hintText: "Email address",
                      icon: SvgPicture.asset(AppAssets.svgEmailIcon, height: 20),
                      controller: controller.emailController,
                      focusNode: controller.emailFocus,
                      isFocused: controller.isEmailFocused,
                    ),
                    const SizedBox(height: 16),

                    // Mobile Number
                    AppSimpleTextField(
                      hintText: "Mobile number",
                      icon: Icon(Icons.phone),
                      controller: controller.phoneController,
                      focusNode: controller.phoneFocus,
                      isFocused: controller.isPhoneFocused,
                    ),
                    const SizedBox(height: 16),

                    // Password
                    AppPasswordTextField(
                      hintText: "Password",
                      leadingIcon: Icon(Icons.lock),
                      controller: controller.passwordController,
                      focusNode: controller.passwordFocus,
                      isFocused: controller.isPasswordFocused,
                      isObscure: controller.isObscurePassword,
                    ),
                    const SizedBox(height: 16),

                    Text.rich(
                      TextSpan(
                        text: "By signing up you agree to our ",
                        style: TextStyle(color: Colors.black54),
                        children: [
                          TextSpan(
                            text: "Term of use and privacy notice",
                            style: TextStyle(
                              color: Color(0xFF146C76),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    AppButton.primary(
                      text: "Join Now",
                      isLoading: controller.isLoading,
                      onPressed: controller.signUp,
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
                      text: "Join with Google",
                      onPressed: controller.signInWithGoogle,
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
                            Get.back(); // Or navigate to login
                          },
                          child: const Text.rich(
                            TextSpan(
                              text: "Already have an account? ",
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "Sign In",
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
