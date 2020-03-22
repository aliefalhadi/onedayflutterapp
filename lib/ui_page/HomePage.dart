import 'package:flutter/material.dart';
import 'package:flutternews4/models/NewsModel.dart';
import 'package:flutternews4/ui_view/ItemHorizontal.dart';
import 'package:flutternews4/ui_view/ItemVertical.dart';
import 'package:http/http.dart' as http;

class ConstantUrl{
  static const baseUrl = "http://172.20.10.4:8888/server_fluttercoding/index.php/Api/";
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  Future<List> getNews() async{
    final response = await http.get(ConstantUrl.baseUrl+"getNews");

    var listData = newsModelFromJson(response.body);
//print(listData.article);
    return listData.article;
  }
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 28, top: 24, right: 28),
            child: Text("Stories", style: TextStyle(color:Colors.red, fontSize: 28, fontWeight: FontWeight.bold),),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3.5,
//            padding: EdgeInsets.only(left: 16, right: 16, top: 4 , bottom: 16),
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
              future: getNews(),
              builder:  (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ?

                    ItemHorizontal(list: snapshot.data)
                    :
                    Center(
                      child: CircularProgressIndicator(),
                    );
              },
            )
          ),
          Container(
            padding: EdgeInsets.only(left: 28, top: 4, right: 28),
            child: Text("Headlines", style: TextStyle(color:Colors.red, fontSize: 28, fontWeight: FontWeight.bold),),
          ),

          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: FutureBuilder(
              future: getNews(),
              builder: (context , snapshot){
                if(snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ?
                    ItemVertical(list:snapshot.data)
                    :
                Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )


        ],
      ),
    );
  }
}
