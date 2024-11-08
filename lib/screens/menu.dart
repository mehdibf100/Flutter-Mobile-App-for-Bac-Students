import 'package:first_project/screens/chooseLevel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first_project/service/resultaService.dart';
import '../controller/homeController.dart';
import '../controller/userController.dart';

class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final ResultService _resultService = ResultService();
  final UserController _userController = Get.find<UserController>();
  homeController controller = Get.put(homeController());

  int selectedIndex = 0;
  List<Map<String, dynamic>> results = [];

  @override
  void initState() {
    super.initState();
    _loadResults();
  }

  Future<void> _loadResults() async {
    results = await _resultService.loadResults();
    setState(() {});
  }

  List<Widget> get listWidget => [
    _buildHomeWidget(),
    _buildResultsWidget(),
    _buildAboutUsWidget(),
  ];

  Widget _buildHomeWidget() {
    return ListView(
      children: [
        Column(
          children: [
            _buildHeader(), // Header avec le texte et l'image
            SizedBox(height: 20), // Ajoute un espace entre l'image et les boutons
            _buildSectionButtons(), // Les boutons des matières sont ici
          ],
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Image.asset("images/Cap.JPG"),
          SizedBox(height: 20),
          Text(
            "Choose Your Section",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFF1565C0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSectionButton("Technique", "images/technique.png"),
            SizedBox(width: 40),
            _buildSectionButton("Informatique", "images/informatique.png"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSectionButton("Sciences", "images/science.png"),
            SizedBox(width: 40),
            _buildSectionButton("Math", "images/math.png"),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionButton(String title, String imagePath) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          MaterialButton(
            onPressed: () => Get.to(Level(bac:title ,)),
            child: Image.asset(imagePath, height: 90),
          ),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      width: 130,
      height: 130,
      margin: EdgeInsets.only(top: 20,bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(2.0, 2.0),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
    );
  }

  Widget _buildResultsWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Résultats',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          results.isEmpty
              ? Center(child: Text('Aucun résultat enregistré.'))
              : ListView.builder(
            shrinkWrap: true,
            itemCount: results.length,
            itemBuilder: (context, index) {
              final result = results[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: Text(
                      'Matière: ${result['bac']} - Trimestre: ${result['matiere']}'),
                  subtitle: Text('Score: ${result['score']}/20'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAboutUsWidget() {
    return const Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/appstore.png'),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Notre Mission',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Nous sommes une plateforme dédiée à l\'éducation, spécialement conçue pour aider les étudiants tunisiens à se préparer efficacement au Baccalauréat.',
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
          Center(
            child: Text(
              '© 2024 - Tous droits réservés',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true ,
        title: const Text(
          "Welcome",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color(0xFF1565C0),
          ),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.window, color: Color(0xFF1565C0)),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (val) {
          setState(() {
            selectedIndex = val;
          });
        },
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.black,
        iconSize: 25,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ""),
        ],
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [
              _buildUserInfo(),
              _buildDrawerItem("homepage", Icons.home),
              _buildDrawerItem("Account", Icons.account_balance_rounded),
              _buildDrawerItem("About Us", Icons.help),
              _buildDrawerItem("Contact", Icons.phone),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: listWidget[selectedIndex],
      ),
    );
  }

  Widget _buildUserInfo() {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(
              "images/user.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text('Bienvenue, ${_userController.userName.value}'),
            subtitle:Text(
              'Email: ${_userController.userEmail.value}',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDrawerItem(String title, IconData icon) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: () {},
    );
  }
}
