import 'package:first_project/screens/about.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/userController.dart';


void main() {
  Get.put(UserController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: About(),
    );
  }
}
