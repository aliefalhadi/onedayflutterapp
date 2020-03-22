import 'package:flutter/material.dart';

class Listvieww extends StatefulWidget {
  @override
  _ListviewwState createState() => _ListviewwState();
}

class _ListviewwState extends State<Listvieww> {

  List data = ["kucing","anjing","babi","marmut"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview"),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context,index){
        return  Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Card(
            color: Colors.red,
            child: Text(data[index]),
          ),
        );
      })


//      ListView(
//        scrollDirection: Axis.vertical,
//        children: <Widget>[
//          Container(
//            width: MediaQuery.of(context).size.width,
//            height: 200,
//            child: Card(
//              color: Colors.red,
//            ),
//          ),
//          Container(
//            width: MediaQuery.of(context).size.width,
//            height: 200,
//            child: Card(
//              color: Colors.blue,
//            ),
//          ),
//          Container(
//            width: MediaQuery.of(context).size.width,
//            height: MediaQuery.of(context).size.height / 4,
//            child: Card(
//              color: Colors.orange,
//            ),
//          ),
//          Container(
//            width: MediaQuery.of(context).size.width,
//            height: MediaQuery.of(context).size.height / 4,
//            child: Card(
//              color: Colors.orange,
//            ),
//          ),
//        ],
//      ),
    );
  }
}
