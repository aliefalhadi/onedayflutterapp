import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ConstantUrl{
  static const baseUrl = "http://172.20.10.4:8888/server_fluttercoding/index.php/Api/";
}
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController etName = TextEditingController();
  TextEditingController etEmail = TextEditingController();
  TextEditingController etPassword = TextEditingController();


  bool _isPassVisible = true;
  String valFriend = null;

  bool isLoading = false;

  List myFriends = [
    "Laki-Laki",
    "Perempuan"
  ];

  void registerUser() async{

    final response = await http.post(ConstantUrl.baseUrl+"registerUser",
    body: {
      'email': etEmail.text.toString(),
      'name': etName.text.toString(),
      'password': etPassword.text.toString(),
    }
    );
    var listData = jsonDecode(response.body);

    if(listData['status'] ==200){
      setState(() {
        isLoading = true;
        loadData(listData['status']);

      });
    }else{
      setState(() {
        isLoading = true;
        loadData(listData['status']);
      });

    }
  }

  Future<Timer> loadData(int status) async{
    if(status == 200){
      return Timer(Duration(seconds: 4), (){
        setState(() {
          isLoading = false;
          Navigator.pop(context);
        });
      });
    }else{
      return Timer(Duration(seconds: 4), (){
        setState(() {
          isLoading = false;
          showDialog(
            context: context,
            builder: (context){
                return AlertDialog(
                  title: Text("Information"),
                  content: Text("Email Telah terdaftar"),
                );
            }
          );
        });
      });
    }
  }

  Widget signText = Text("Sign In", style: TextStyle(color: Colors.blue),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              elevation: 4,
              child: Container(
                padding: EdgeInsets.only(left:20, right: 20, top: 20, bottom: 20),
                width: MediaQuery.of(context).size.width,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Register", style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 2
                    ),),

                    SizedBox(height: 20,),
                    Text("Let's get", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 2
                    ),),
                    Text("You on Board", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 2
                    ),),

                    SizedBox(height: 20,),

                    Theme(
                      data: ThemeData(primaryColor: Colors.redAccent),
                      child: TextFormField(
                        controller: etName,
                        decoration: InputDecoration(
                            hintText: "Full Name"
                        ),
                      ),
                    ),

                    Theme(
                      data: ThemeData(primaryColor: Colors.redAccent),
                      child: TextFormField(
                        controller: etEmail,
                        decoration: InputDecoration(
                            hintText: "Email"
                        ),
                      ),
                    ),

                    Theme(
                      data: ThemeData(primaryColor: Colors.redAccent),
                      child: TextFormField(
                        controller: etPassword,
                        obscureText: _isPassVisible,
                        decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: IconButton(
                              icon: _isPassVisible == true ? Icon(Icons.visibility): Icon(Icons.visibility_off),
                              onPressed: (){
                                setState(() {
                                  if(_isPassVisible == true){
                                    _isPassVisible = false;
                                  }else{
                                    _isPassVisible = true;
                                  }
                                });
                              },
                            )
                        ),
                      ),
                    ),




                    SizedBox(height: 20,),

                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child:
                      isLoading == true ?
                     Center(
                       child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                         valueColor: AlwaysStoppedAnimation(Colors.redAccent),

                       ),
                     )
                      :
                        RaisedButton(
                        child: Text('Register', style: TextStyle(color: Colors.white, letterSpacing: 5),),
                        color: Colors.redAccent,
                        onPressed: (){
                          registerUser();
                        },
                      ),
                    ),

                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Divider(
                            thickness: 3,
                            height: 2,

                          ),
                        ),
                        SizedBox(width: 16,),
                        Flexible(
                            flex: 1,
                            child: Text("Or")
                        ),
                        SizedBox(width: 16,),

                        Flexible(
                          flex: 2,
                          child: Divider(
                            thickness: 2,
                          ),
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        OutlineButton(
                          highlightElevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Text("Google", style: TextStyle(letterSpacing: 3)),
                          onPressed: (){},
                        ),
                        OutlineButton(

                          highlightElevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Text("Facebook", style: TextStyle(letterSpacing: 3),),
                          onPressed: (){},
                        ),
                      ],
                    ),

                    FlatButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Already have an account?"),
                          Text("Sig In", style: TextStyle(color: Colors.blue),)
                        ],
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
