import 'package:flutter/material.dart';

class Third extends StatefulWidget {
  @override
  _ThirdState createState() => _ThirdState();
}

class _ThirdState extends State<Third> {

  DateTime _dueDate = DateTime.now();

  Future selectDueDate(BuildContext context) async {
    var picked = await showDatePicker(
        context: context,
        initialDate: _dueDate,
        firstDate: DateTime(1945),
        lastDate: DateTime(2099)
    );

    if(picked != null){
        setState(() {
          _dueDate = picked;
        });

//        selectdueTime(context);
    }else{

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Third Page"),),
      body: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.category),
              hintText: "Text Nama"
            ),
          ),
          RaisedButton(
            child: Text("Tgl Lahir"),
            onPressed: (){
              selectDueDate(context);
            },
          )
        ],
      ),
    );
  }
}
