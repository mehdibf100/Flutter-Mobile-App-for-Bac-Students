import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemsDetails extends StatefulWidget{
  final data;
  const ItemsDetails({super.key,this.data});

  @override
  State<StatefulWidget> createState()=>_ItemsDetailsState();
}

class _ItemsDetailsState extends State<ItemsDetails>{
  int nmb=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize:40 ,
        selectedItemColor: Colors.orange,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "*"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),label: "$nmb",),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "*")
        ],),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.grey[200],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.shopping_bag_outlined)  ,
          Text(" E-commerce ",style: TextStyle(color: Colors.black)),
          Text("Shop",style: TextStyle(color: Colors.orange)),
        ]),
        elevation: 0.0,
      ),
      endDrawer:Drawer(
          child: Container(
            padding: EdgeInsets.all(15),
            child: ListView(
              children: [
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.network("https://scontent.ftun1-2.fna.fbcdn.net/v/t39.30808-1/438170133_3799084310417297_7632685236989065485_n.jpg?stp=dst-jpg_s200x200&_nc_cat=101&ccb=1-7&_nc_sid=0ecb9b&_nc_ohc=OcfA6V-fcywQ7kNvgHIIuMe&_nc_ht=scontent.ftun1-2.fna&cb_e2o_trans=q&oh=00_AYBFnETVDxsQ3tvd5DKNHeaFbBwDL0GrkkSBx5yLVmSrZw&oe=66DB7CFC",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(child: ListTile(
                      title: Text("Mehdi ben fekhta"),
                      subtitle: Text("Mehdi.benfakhta@gmail.com",style: TextStyle(fontSize: 12),),
                    ))
                  ],
                ),
                ListTile(
                  title: Text("homepage"),
                  leading: Icon(Icons.home),
                  onTap: (){},
                ),   ListTile(
                  title: Text("Account"),
                  leading: Icon(Icons.account_balance_rounded),
                  onTap: (){},
                ),
                ListTile(
                  title: Text("About As"),
                  leading: Icon(Icons.help),
                  onTap: (){},
                ),
                ListTile(
                  title: Text("Contact"),
                  leading: Icon(Icons.phone),
                  onTap: (){},
                ),
              ],),
          )),
      body: ListView(
        children: [
          Image.asset(widget.data["icon"],fit: BoxFit.fill,height:400,),
          Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Text(widget.data["title"],textAlign:TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
          Container(child: Text(widget.data["disc"],textAlign:TextAlign.center,style: TextStyle(color: Colors.grey[800]),),),
          Container(
              margin: EdgeInsets.only(top: 10.0,bottom: 25),
              child: Text(widget.data["price"],textAlign:TextAlign.center,style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),)),
         Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Color : ",style: TextStyle(color: Colors.grey),),
              SizedBox(width:10),
              Container(height: 20,width: 20,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.orange)
              ),
              ),
              Text(" Grey"),
              SizedBox(width:20),
              Container(height: 20,width: 20,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                ),
              ),
              Text(" Black")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
              margin: EdgeInsets.only(top: 20),
                child: Text("Size :   30 31 32 33 34 35",style: TextStyle(color: Colors.grey)))
          ],),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
            padding: EdgeInsets.symmetric(vertical: 15),
            child: MaterialButton(onPressed: (){setState(() {
              nmb++;
            });},
              child: Text("Add To Cart"),
              textColor: Colors.white,
              color: Colors.black,),
          )
        ],
      ),
    );
  }
}