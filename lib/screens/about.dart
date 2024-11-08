import 'package:first_project/screens/menu.dart';
import 'package:first_project/screens/saveName.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/userController.dart';
class About extends StatelessWidget {
  final UserController _userController = Get.find<UserController>();

  About({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: Text("Bac QCM",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),backgroundColor: Colors.white,),
        body:  Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height*0.35,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(200)),
                  margin: EdgeInsets.symmetric(vertical: 40,horizontal: 10),
                  child: Image.asset("images/images.png")),
              Container(child: const Text("Find Your Favourite QCM",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 24,fontFamily: 'Poppins',  ),),),
              SizedBox(height: 5),
              Container(
                width: 60,
                height: 3,
                color: Colors.blueAccent,
              ),
              SizedBox(height: 15),
              // Texte secondaire en dessous
             Container(
               margin: EdgeInsets.symmetric(horizontal: 8),
               child: const Text(
                  'Anyone can join the millions of members in\nour community to learn cutting edge skills.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
             ),
              Column(
                mainAxisAlignment:MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(top:MediaQuery.of(context).size.height)*0.15,
                    child:  MaterialButton(
                      minWidth: 300,
                      onPressed:(){
                        if(_userController.userName.value==""){
                          Get.offAll(HomeScreen());
                        }
                        else {Get.offAll(Menu());}
                      },
                      padding: EdgeInsets.symmetric(vertical:22),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      child: Text("Get started",),
                      color: Colors.blue[800],textColor: Colors.white,),
                  ),
                ],
              ),
            ],
          )
        ),

    );
  }
}