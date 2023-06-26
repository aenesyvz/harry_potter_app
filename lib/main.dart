import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harry_potter_app/bindings/init_dependency.dart';
import 'package:harry_potter_app/views/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitDependency(),
      title: 'Harry Potter',
      home: const SplashPage(),
    );
  }
}
