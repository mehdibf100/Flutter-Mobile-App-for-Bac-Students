import 'package:first_project/screens/menu.dart';
import 'package:first_project/service/userService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final UserService _userService = UserService();

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  // Load saved user information
  _loadUserInfo() async {
    final userInfo = await _userService.loadUserInfo();
    if (userInfo['name'] != null) {
      Get.offAll(Menu());
    }
  }

  // Save user information and navigate to Menu
  _saveUserInfo() async {
    await _userService.saveUserInfo(_nameController.text, _emailController.text);
    Get.offAll(Menu());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50], // Light background for a fresher look
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        centerTitle: true,
        title: Text('Enregistrer vos Informations',style:TextStyle(color: Colors.white),textAlign: TextAlign.center,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Add more padding for spacing
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch to fill the screen width
            children: [
              SizedBox(height: 40), // Add spacing from the top
              Text(
                'Bienvenue! Veuillez entrer vos informations.',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900], // Change text color for contrast
                ),
                textAlign: TextAlign.center, // Center the text
              ),
              SizedBox(height: 30), // Add spacing before the text fields
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nom',
                  filled: true,
                  fillColor: Colors.white, // White background for the input field
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded borders
                  ),
                  prefixIcon: Icon(Icons.person, color: Colors.blue[800]),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.email, color: Colors.blue[800]),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 40), // Add more spacing before the button
              ElevatedButton(
                onPressed: _saveUserInfo,
                child: Text(
                  'Enregistrer',
                  style: TextStyle(fontSize: 18,color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  padding: EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded button
                  ),
                  elevation: 5, // Add shadow for a raised effect
                ),
              ),
              SizedBox(height: 20), // Add spacing at the bottom
              Text(
                'Toutes les informations seront sauvegardées.',
                style: TextStyle(fontSize: 14, color: Colors.blue[700]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
