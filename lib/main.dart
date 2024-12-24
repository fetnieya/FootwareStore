import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:store/controller/home_controller.dart';
import 'package:store/firebase_options.dart';
import 'package:store/pages/home_page.dart';
import 'package:get/get.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: firebaseOptions);
  // Register the HomeController
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
