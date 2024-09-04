import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<StatefulWidget> createState()=>_HomeState();
}
class _HomeState extends State<Home>{

  @override
  void initState() {
    super.initState();
  }
  @override
Widget build(BuildContext context){
    return Scaffold(
    appBar: AppBar(
      title:const Text("Quiz App",style: TextStyle(color: Colors.white),),backgroundColor:Colors.purple,
    ),
      body: Column(
        children: [
          Expanded(child: SizedBox(),flex: 2,),
          Expanded(
            flex: 2,
              child: Container(
                  margin: EdgeInsets.all(10),
                  child: Text("1- Combien vaudra la variable y à la fin de ce programme ?",style: TextStyle(fontSize: 20)))),
          Expanded(child: SizedBox(),flex: 1,),
          Expanded(
            flex: 6,
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context,i){
              return    Container(
                margin:EdgeInsets.symmetric(vertical: 20) ,
                child: Center(
                    child: MaterialButton(
                      minWidth: 200,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        onPressed: (){},child: Text("isdigit()",style: TextStyle(color: Colors.white),),color: Colors.purple)),
              );
                }),
          ),
          Expanded(child: SizedBox(),flex: 2,),
        ],
      )
    );
  }
  }