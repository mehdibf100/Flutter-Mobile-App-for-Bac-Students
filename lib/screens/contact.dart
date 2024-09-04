import 'package:first_project/screens/home.dart';
import 'package:flutter/material.dart';

import 'about.dart';

class Contact extends StatelessWidget {
  Contact({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Contact Page",style: TextStyle(color:Colors.white),),backgroundColor: Colors.black,),
      body: ListView(children: [
        Center(child: Text("Contact Page",style: TextStyle(fontSize: 30),textAlign:TextAlign.center,),),
       Container(
         margin: EdgeInsets.symmetric(horizontal: 20),
         child:  MaterialButton(
             color: Colors.cyan,textColor: Colors.white,
             child: Text("Go to Home Us"),
             onPressed:(){
               Navigator.of(context).pushNamed("Home");
             }),
       ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child:MaterialButton(
            color: Colors.cyan,textColor: Colors.white,
            child: Text("Go to About Us"),
            onPressed:(){
              Navigator.of(context).pushNamed("about");
            }),
      ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child:MaterialButton(
              color: Colors.cyan,textColor: Colors.white,
              child: Text("Back"),
              onPressed:(){
                Navigator.of(context).pop();
              }),
        )
      ],),
    );
  }
}