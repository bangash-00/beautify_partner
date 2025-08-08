import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;

  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  final isEmailFocused = false.obs;
  final isPasswordFocused = false.obs;
  final isObscurePassword = true.obs;


  void togglePasswordVisibility() {
    isObscurePassword.value = !isObscurePassword.value;
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // User canceled the login
        return;
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Navigate to home screen or wherever needed
      Get.offAllNamed(Routes.HOME);

    } catch (e) {
      print('Google Sign-In Error: $e');
      Get.snackbar("Login Failed", "An error occurred during Google login.");
    }
  }


  void login() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email and password must not be empty.");
      return;
    }

    if (!isValidEmail(email)) {
      Get.snackbar("Error", "Please enter a valid email.");
      return;
    }


    isLoading.value = true;

    try {
      // Attempt to sign in with email and password
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Navigate to the home screen
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      // Firebase-specific errors
      String message;

      switch (e.code) {
        case 'user-not-found':
          message = 'No user found for that email.';
          break;
        case 'wrong-password':
          message = 'Incorrect password.';
          break;
        case 'invalid-email':
          message = 'Invalid email format.';
          break;
        default:
          message = 'Login failed. Please try again.';
          break;
      }

      Get.snackbar("Login Failed", message);
    } catch (e) {
      // General error
      Get.snackbar("Error", "An unexpected error occurred.");
    } finally {
      isLoading.value = false;
    }
  }


  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }


  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.onClose();
  }
}
