import 'package:first_project/screens/about.dart';
import 'package:first_project/screens/contact.dart';
import 'package:first_project/screens/details.dart';
import 'package:first_project/screens/home.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes:{
      "home":(context)=>Home(),
      "about":(context)=>About(),
      "contact":(context)=>Contact(),
       "datails":(context)=>ItemsDetails(),

    } ,
    );
  }
}
