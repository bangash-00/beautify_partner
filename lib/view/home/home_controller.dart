import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:beautify_partner/configs/get_it.dart';

class HomeController extends GetxController {
  RxString userName = ''.obs;


  @override
  void onInit() {
    super.onInit();
    getIt<LoggerService>().info('HomeController: Home screen initialized');
    fetchUserName();

  }

  void fetchUserName() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) return;

      final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (doc.exists) {
        userName.value = doc.data()?['name'] ?? '';
      }
    } catch (e) {
      print('Failed to fetch user name: $e');
    }
  }
}
