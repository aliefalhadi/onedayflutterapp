import 'package:flutter/material.dart';
import 'package:onedayapp/DetailData.dart';
import 'package:onedayapp/Third.dart';

import 'Listvieww.dart';
import 'One.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int myIndexTab = 0;

  void onTapNav(index){
    setState(() {
      myIndexTab = index;
    });
  }

  List<BottomNavigationBarItem> bottomNav = [
    BottomNavigationBarItem(title: Text("Home"),icon: Icon(Icons.home)),
    BottomNavigationBarItem(title: Text("Second"),icon: Icon(Icons.category)),
    BottomNavigationBarItem(title: Text("Third"),icon: Icon(Icons.list)),
    BottomNavigationBarItem(title: Text("List"),icon: Icon(Icons.person)),
  ];
  List page = [
    One(),
    DetailData(textSatu: "Satu - ", textDua: " Dua"),
    Third(),
    Listvieww()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("Menu 1"),

            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: TextStyle(color: Colors.blueAccent),
        ),
        backgroundColor: Colors.grey,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: myIndexTab,
        items: bottomNav,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index){
          onTapNav(index);
        },
      ),
      body: page[myIndexTab]

    );
  }
}
