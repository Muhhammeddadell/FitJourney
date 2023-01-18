import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:workout_application/presentation/controllers/auth_controller.dart';
import 'package:workout_application/presentation/screens/home/home_page.dart';
import 'package:workout_application/video_info.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'presentation/controllers/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthService.handleAuthState(),
    );
  }
}
