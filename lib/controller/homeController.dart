import 'package:first_project/model/quizModel.dart';
import 'package:first_project/screens/chooseTrimestre.dart';
import 'package:first_project/screens/home.dart';
import 'package:get/get.dart';
import 'package:first_project/screens/Result.dart';
class homeController extends GetxController{


List<Quizmodel>quiz=PythonQuiz[0];
List<List<Quizmodel>>quizPython=PythonQuiz;
List<List<Quizmodel>>quizMath=MathQuiz;
List<List<Quizmodel>>quizSciences=ScienceQuiz;
int index=0;
int result=0;
bool color=false;
late String testNote;
String matiere="";
int timestre=0;
Onchange(i,Matiere,Trimestre){
  matiere=Matiere;
  timestre=Trimestre;
  quiz[index].answers[i]==quiz[index].correct?Correct():go();
  update();
}
Correct () async {
  color=true;
  result+=4;
  await Future.delayed(const Duration(milliseconds: 300));
  update();
  index!=4? index++:Get.off(Result(result:result));
  color=false;
  update();
}
go(){
  index!=4? index++:Get.off(Result(result:result));
}

getTextResult(){
  if(result>=40){
    testNote="Excellent";
  }
  else if(result<=20){
    testNote="Very Bad";
  }
  else{
    testNote="Good";
  }
  return testNote;
}
}
List<List<Quizmodel>> PythonQuiz = [
  [
    Quizmodel(
        question: "Quel est le résultat de 3 + 2 * 2 en Python ?",
        answers: ["7", "10", "9", "5"],
        correct: "7"
    ),
    Quizmodel(
        question: "Quel type de données est renvoyé par la fonction input() en Python ?",
        answers: ["int", "str", "bool", "float"],
        correct: "str"
    ),
    Quizmodel(
        question: "Comment crée-t-on une fonction en Python ?",
        answers: ["function myFunction():", "def myFunction():", "func myFunction():", "create myFunction():"],
        correct: "def myFunction():"
    ),
    Quizmodel(
        question: "Quelle est la bonne syntaxe pour un commentaire en une seule ligne en Python ?",
        answers: ['"<!-- commentaire -->"', "// commentaire", "# commentaire", "/* commentaire */"],
        correct: "# commentaire"
    ),
    Quizmodel(
        question: "Quelle méthode est utilisée pour ajouter un élément à la fin d'une liste en Python ?",
        answers: ["append()", "add()", "insert()", "push()"],
        correct: "append()"
    ),
    Quizmodel(
        question: "Comment convertir une chaîne en un entier en Python ?",
        answers: ["int()", "str()", "float()", "convert()"],
        correct: "int()"
    ),
    Quizmodel(
        question: "Quelle est la sortie de print(type([])) en Python ?",
        answers: ["<class 'list'>", "<class 'dict'>", "<class 'set'>", "<class 'tuple'>"],
        correct: "<class 'list'>"
    ),
  ],

  // Quiz from Tunisian Baccalaureate Informatique
  [
    Quizmodel(
        question: "Que signifie OOP en programmation informatique ?",
        answers: ["Organisation of Objects in Python", "Object-Oriented Programming", "Optimal Object Procedure", "Object-Operation Process"],
        correct: "Object-Oriented Programming"
    ),
    Quizmodel(
        question: "Quel mot-clé est utilisé pour hériter d'une classe en Python ?",
        answers: ["inherit", "extends", "super", "class"],
        correct: "class"
    ),
    Quizmodel(
        question: "Quelle structure de données est utilisée pour stocker des paires clé-valeur en Python ?",
        answers: ["List", "Dictionary", "Tuple", "Set"],
        correct: "Dictionary"
    ),
    Quizmodel(
        question: "Quelle est la complexité temporelle de la recherche dans une liste triée en utilisant la recherche binaire ?",
        answers: ["O(n)", "O(n^2)", "O(log n)", "O(1)"],
        correct: "O(log n)"
    ),
    Quizmodel(
        question: "En Python, comment appelle-t-on une fonction sans corps ?",
        answers: ["Anonymous function", "Empty function", "Abstract function", "Lambda function"],
        correct: "Lambda function"
    ),
  ],

  // Additional Quiz on Python
  [
    Quizmodel(
        question: "Quelle est la sortie de la commande suivante en Python : print(2**3) ?",
        answers: ["6", "8", "9", "7"],
        correct: "8"
    ),
    Quizmodel(
        question: "Quelle bibliothèque est utilisée pour la manipulation de données en Python ?",
        answers: ["NumPy", "Pandas", "Matplotlib", "Scikit-learn"],
        correct: "Pandas"
    ),
    Quizmodel(
        question: "Comment vérifier si une clé existe dans un dictionnaire en Python ?",
        answers: ["has_key()", "exists()", "in", "find_key()"],
        correct: "in"
    ),
    Quizmodel(
        question: "Quelle est la sortie de cette expression : 'Hello'[::-1] en Python ?",
        answers: ["'olleH'", "'Hello'", "'H'", "'oellH'"],
        correct: "'olleH'"
    ),
    Quizmodel(
        question: "Quelle méthode est utilisée pour supprimer un élément d'une liste par son index en Python ?",
        answers: ["remove()", "del", "pop()", "clear()"],
        correct: "pop()"
    ),
  ]
];


List<List<Quizmodel>> ScienceQuiz = [
  [
    Quizmodel(
        question: "Quel est le rôle des mitochondries dans une cellule ?",
        answers: ["Production d'énergie", "Synthèse des protéines", "Réparation de l'ADN", "Division cellulaire"],
        correct: "Production d'énergie"
    ),
    Quizmodel(
        question: "Quelle est la formule chimique de l'acide sulfurique ?",
        answers: ["H2SO4", "HCl", "NaOH", "H2CO3"],
        correct: "H2SO4"
    ),
    Quizmodel(
        question: "Quel est le nom du phénomène par lequel une plante fabrique du glucose à partir de CO2 et d'eau ?",
        answers: ["Photosynthèse", "Respiration", "Fermentation", "Osmose"],
        correct: "Photosynthèse"
    ),
    Quizmodel(
        question: "En physique, quelle est l'unité de mesure de la force ?",
        answers: ["Newton", "Joule", "Watt", "Pascal"],
        correct: "Newton"
    ),
    Quizmodel(
        question: "Comment appelle-t-on la molécule qui stocke l'information génétique dans les cellules ?",
        answers: ["ADN", "ARN", "Protéine", "Enzyme"],
        correct: "ADN"
    ),
  ],

  // Science Quiz S2
  [
    Quizmodel(
        question: "Quel gaz est essentiel à la respiration des organismes vivants ?",
        answers: ["Oxygène", "Azote", "Hydrogène", "Hélium"],
        correct: "Oxygène"
    ),
    Quizmodel(
        question: "Quel est l'élément chimique représenté par le symbole 'Fe' ?",
        answers: ["Fer", "Fluor", "Francium", "Fermium"],
        correct: "Fer"
    ),
    Quizmodel(
        question: "Comment s'appelle le processus de division cellulaire qui produit deux cellules filles identiques ?",
        answers: ["Mitose", "Méiose", "Cytokinèse", "Apoptose"],
        correct: "Mitose"
    ),
    Quizmodel(
        question: "Quel est le plus petit os du corps humain ?",
        answers: ["Étrier", "Fémur", "Humérus", "Clavicule"],
        correct: "Étrier"
    ),
    Quizmodel(
        question: "Quelle planète est la plus proche du Soleil ?",
        answers: ["Mercure", "Vénus", "Terre", "Mars"],
        correct: "Mercure"
    ),
  ],

  // Science Quiz S3
  [
    Quizmodel(
        question: "Quel est l'organe principal responsable de la filtration du sang dans le corps humain ?",
        answers: ["Reins", "Foie", "Cœur", "Poumons"],
        correct: "Reins"
    ),
    Quizmodel(
        question: "Quelle est la vitesse de la lumière dans le vide ?",
        answers: ["300 000 km/s", "150 000 km/s", "1 000 km/s", "100 000 km/s"],
        correct: "300 000 km/s"
    ),
    Quizmodel(
        question: "Quel type de liaison chimique partage des électrons entre deux atomes ?",
        answers: ["Liaison covalente", "Liaison ionique", "Liaison hydrogène", "Liaison métallique"],
        correct: "Liaison covalente"
    ),
    Quizmodel(
        question: "Quelle est la formule chimique de l'eau ?",
        answers: ["H2O", "CO2", "O2", "H2SO4"],
        correct: "H2O"
    ),
    Quizmodel(
        question: "Quelle est la fonction du système immunitaire ?",
        answers: ["Protéger contre les infections", "Réguler la température corporelle", "Transporter l'oxygène", "Produire de l'énergie"],
        correct: "Protéger contre les infections"
    ),
  ],
];

List<List<Quizmodel>> MathQuiz = [
  // Quistion Math S1
  [
    Quizmodel(
        question: "Quelle est la dérivée de la fonction f(x) = x^3 ?",
        answers: ["3x^2", "x^2", "2x", "x^3"],
        correct: "3x^2"
    ),
    Quizmodel(
        question: "Quel est le discriminant de l'équation quadratique suivante : 2x^2 - 4x + 1 = 0 ?",
        answers: ["4", "0", "8", "16"],
        correct: "0"
    ),
    Quizmodel(
        question: "Si la fonction f(x) est continue et dérivable, comment calculer sa tangente en un point x=a ?",
        answers: ["f'(a)", "f(a)", "f(a) + f'(a)", "f(a) / f'(a)"],
        correct: "f'(a)"
    ),
    Quizmodel(
        question: "Quel est le résultat de la limite de 1/x lorsque x tend vers 0 ?",
        answers: ["∞", "-∞", "0", "Indéterminée"],
        correct: "Indéterminée"
    ),
    Quizmodel(
        question: "Si f(x) = ln(x), quelle est la dérivée de f(x) ?",
        answers: ["1/x", "x", "ln(x)", "xln(x)"],
        correct: "1/x"
    ),
  ],

  // Quistion Math S2
  [
    Quizmodel(
        question: "Quelle est la dérivée de la fonction f(x) = x^3 ?",
        answers: ["3x^2", "x^2", "2x", "x^3"],
        correct: "3x^2"
    ),
    Quizmodel(
        question: "Quel est le discriminant de l'équation quadratique suivante : 2x^2 - 4x + 1 = 0 ?",
        answers: ["4", "0", "8", "16"],
        correct: "0"
    ),
    Quizmodel(
        question: "Si la fonction f(x) est continue et dérivable, comment calculer sa tangente en un point x=a ?",
        answers: ["f'(a)", "f(a)", "f(a) + f'(a)", "f(a) / f'(a)"],
        correct: "f'(a)"
    ),
    Quizmodel(
        question: "Quel est le résultat de la limite de 1/x lorsque x tend vers 0 ?",
        answers: ["∞", "-∞", "0", "Indéterminée"],
        correct: "Indéterminée"
    ),
    Quizmodel(
        question: "Si f(x) = ln(x), quelle est la dérivée de f(x) ?",
        answers: ["1/x", "x", "ln(x)", "xln(x)"],
        correct: "1/x"
    ),
  ],

  // Quistion Math S3
  [
    Quizmodel(
        question: "Quel est le résultat de l'intégrale de 2x par rapport à x ?",
        answers: ["x^2 + C", "2x^2", "2x + C", "x^2"],
        correct: "x^2 + C"
    ),
    Quizmodel(
        question: "Soit la fonction f(x) = e^x, quelle est sa dérivée ?",
        answers: ["e^x", "x^e", "1/x", "ln(x)"],
        correct: "e^x"
    ),
    Quizmodel(
        question: "Quel est le centre de symétrie de la fonction f(x) = -x^2 + 4 ?",
        answers: ["(0, 0)", "(2, 0)", "(0, 4)", "(2, 4)"],
        correct: "(0, 4)"
    ),
    Quizmodel(
        question: "Quelle est la solution de l'équation suivante : x^2 - 4x + 4 = 0 ?",
        answers: ["x = 0", "x = 2", "x = -2", "x = 4"],
        correct: "x = 2"
    ),
    Quizmodel(
        question: "Quel est le résultat de la dérivée de f(x) = cos(x) ?",
        answers: ["-sin(x)", "sin(x)", "-cos(x)", "tan(x)"],
        correct: "-sin(x)"
    ),
  ]
];
