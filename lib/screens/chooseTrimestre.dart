import 'package:first_project/controller/homeController.dart';
import 'package:first_project/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Trimestre extends StatelessWidget {
  final String matiere;
  final homeController controller = Get.put(homeController());
  Trimestre({Key? key, required this.matiere}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Choose the Trimestre",
          style: TextStyle(
            color: Color(0xFF424242),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueGrey[50],
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.blueAccent),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTrimesterButton(
              context,
              title: "Premier Trimestre",
              color: Colors.deepPurpleAccent,
              onTap: () => Get.offAll(Home(matiere:this.matiere,trimestre: 1,)),
            ),
            SizedBox(height: 20),
            _buildTrimesterButton(
              context,
              title: "Deuxième Trimestre",
              color: Colors.teal,
              onTap: () => Get.offAll(Home(matiere: this.matiere,trimestre: 2,)),
            ),
            SizedBox(height: 20),
            _buildTrimesterButton(
              context,
              title: "Troisième Trimestre",
              color: Colors.orangeAccent,
              onTap: () => Get.offAll(Home(matiere: this.matiere,trimestre: 3,)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrimesterButton(BuildContext context, {required String title, required Color color, required VoidCallback onTap}) {
    return Container(
      width: double.infinity,
      height: 80,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_today, color: Colors.white),
            SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
