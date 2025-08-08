import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'configs/get_it.dart';
import 'firebase_options.dart';
import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Setup GetIt
  configureDependencies();
  await getIt.allReady();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beautify Partner',
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
    ),
  );
}
