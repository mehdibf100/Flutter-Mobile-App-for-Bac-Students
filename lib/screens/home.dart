import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first_project/controller/homeController.dart';

class Home extends StatefulWidget {
  final String matiere; // Receiving the variable
  final int trimestre;
  const Home({Key? key, required this.matiere,required this.trimestre}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  homeController controller = Get.put(homeController());
  List quiz = [];

  @override
  void initState() {
    super.initState();

    if (widget.matiere == "Math") {
      if(widget.trimestre==1){
      quiz = controller.quizMath[0];}
      else if(widget.trimestre==2){
        quiz = controller.quizMath[1];}
      else quiz = controller.quizMath[2];

    } else if (widget.matiere == "Informatique") {
      if(widget.trimestre==1){
        quiz = controller.quizPython[0];}
      else if(widget.trimestre==2){
        quiz = controller.quizPython[1];}
      else quiz = controller.quizPython[2];
    } else if (widget.matiere == "Sciences") {
      if(widget.trimestre==1){
        quiz = controller.quizSciences[0];}
      else if(widget.trimestre==2){
        quiz = controller.quizSciences[1];}
      else quiz = controller.quizSciences[2];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quiz App",
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.blueAccent),
      ),
      body: GetBuilder<homeController>(
        builder: (controller) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            child: Column(
              children: [
                // Displaying the quiz progress
                Text(
                  "Question: ${controller.index + 1} / 5",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueAccent[700],
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),

                // Displaying the question
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Text(
                    quiz[controller.index].question,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
                const SizedBox(height: 30),

                // Displaying the answers
                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, i) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: controller.color == true &&
                              quiz[controller.index].answers[i] ==
                                  quiz[controller.index].correct
                              ? Colors.green
                              : Colors.white,
                          onPressed: () {
                            controller.Onchange(i, widget.matiere,widget.trimestre);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              quiz[controller.index].answers[i],
                              style: TextStyle(
                                color: Colors.blueAccent[700],
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
