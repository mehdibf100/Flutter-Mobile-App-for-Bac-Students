import 'package:first_project/controller/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chooseTrimestre.dart';

class Level extends StatelessWidget {
  final homeController controller = Get.put(homeController());
  final String bac;

  Level({
    Key? key,
    required this.bac
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: const Text(
                "Choose Your Matiere",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.black38,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
            _buildMaterialButton(context, "images/MathLLogo.png", "Math", 'Math'),
            _buildMaterialButton(context, "images/informatiqueLogo.jpg", "Informatique", 'Informatique'),
            if (bac != 'Technique' && bac != 'Informatique')
              _buildMaterialButton(context, "images/sciencesLogo.jpg", "Sciences", 'Sciences'),
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialButton(BuildContext context, String imagePath, String title, String subject) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: () {
          Get.offAll(Trimestre(matiere: subject));
        },
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Image.asset(imagePath, height: 60),
            const SizedBox(width: 30),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF1565C0),
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF1565C0),
            ),
          ],
        ),
      ),
    );
  }
}
