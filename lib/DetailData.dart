import 'package:flutter/material.dart';

class DetailData extends StatefulWidget {
  String textSatu,textDua;

  DetailData({this.textDua,this.textSatu});

  @override
  _DetailDataState createState() => _DetailDataState();
}

class _DetailDataState extends State<DetailData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text(
         "Detail Page"
       ),
     ),
     body: Column(
       children: <Widget>[

         Text(
           widget.textSatu + widget.textDua
         )
       ],

     ),
    )
    ;
  }
}
