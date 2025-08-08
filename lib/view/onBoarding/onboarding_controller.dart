import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:beautify_partner/routes/app_pages.dart';

class OnboardingController extends GetxController {
  RxInt currentPage = 0.obs;

  void nextPage() {
    if (currentPage.value < 3) {
      currentPage.value++;
    }
  }

  void skipToSignIn() {
    Get.offAllNamed(Routes.LOGIN); // Replace with actual route name
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  /// Google Sign-In
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
}
