import 'package:first_project/screens/contact.dart';
import 'package:first_project/screens/home.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  About({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("About Us Page",style: TextStyle(color:Colors.white),),backgroundColor: Colors.black,),
      body: ListView(children: [
        Center(child: Text("About Us Page",style: TextStyle(fontSize: 30),textAlign:TextAlign.center,),),
        MaterialButton(
            color: Colors.cyan,textColor: Colors.white,
            child: Text("Go to Home Us"),
            onPressed:(){
              Navigator.of(context).pushReplacementNamed("home");
            },),
        MaterialButton(
            color: Colors.cyan,textColor: Colors.white,
            child: Text("Go to Contact Us"),
            onPressed:(){
              Navigator.of(context).pushNamed("contact");
            })
      ],),
    );
  }
}