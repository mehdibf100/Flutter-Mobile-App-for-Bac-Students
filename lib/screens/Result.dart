import 'package:first_project/controller/homeController.dart';
import 'package:first_project/screens/home.dart';
import 'package:first_project/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/resultaService.dart';

class Result extends StatelessWidget {
  Result({
    Key? key,
    required this.result
  }) : super(key: key);

  final homeController controller = Get.find();
  final ResultService _resultService = ResultService();
  final int result;

  @override
  Widget build(BuildContext context) {
    controller.getTextResult();

    _saveCurrentResult();

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 180,
                width: 180,
                margin: EdgeInsets.only(bottom: 20, top: 100),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 8.0, style: BorderStyle.solid),
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(300),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(controller.testNote, style: TextStyle(fontSize: 25, color: Colors.white)),
                    Text("Your score", style: TextStyle(fontSize: 25, color: Colors.white)),
                    Text("$result/20", style: TextStyle(fontSize: 30, color: Colors.white)),
                  ],
                ),
              ),
              Column(
                children: [
                  Text("Congratulations", style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.w600, fontSize: 20)),
                  Text("Great job, you did it!", style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.w400, fontSize: 15)),
                  Container(height: MediaQuery.of(context).size.height / 4),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      onPressed: () {
                        controller.index = 0;
                        controller.result = 0;
                        controller.update();
                        Get.offAll(Home(matiere: controller.matiere, trimestre: controller.timestre));
                      },
                      child: Text("Play Again", style: TextStyle(fontSize: 15)),
                      textColor: Colors.white,
                      color: Colors.blue[800],
                    ),
                  ),
                  Container(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      onPressed: () {
                        controller.index = 0;
                        controller.result = 0;
                        controller.update();
                        Get.offAll(Menu());
                      },
                      child: Text("Back to Home", style: TextStyle(fontSize: 15)),
                      textColor: Colors.white,
                      color: Colors.blue[800],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fonction pour sauvegarder le résultat actuel
  Future<void> _saveCurrentResult() async {
    Map<String, dynamic> newResult = {
      'bac': controller.matiere, // Section ou matière choisie
      'matiere': controller.timestre, // Trimestre ou autre info
      'score': result, // Le score de la partie
    };

    await _resultService.addResult(newResult); // Ajout du nouveau résultat à la liste
  }
}
