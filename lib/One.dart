import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class One extends StatefulWidget {
  @override
  _OneState createState() => _OneState();
}

class _OneState extends State<One> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("One"),),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    "Tes1 snack bar "
                  ),
                  color: Colors.green,
                  onPressed: (){
                    final snackbar = SnackBar(
                      content: Text("INI SNACKBAR"),
                      backgroundColor: Colors.grey,
                      action: SnackBarAction(
                        label: 'Kembali',
                        onPressed: (){

                        },
                      ),
                    );
                    Scaffold.of(context).showSnackBar(snackbar);
                  },
                ),
                RaisedButton(
                  child: Text(
                      "Tes1 snack bar "
                  ),
                  color: Colors.green,
                  onPressed: (){
                    final snackbar = SnackBar(
                      content: Text("INI SNACKBAR"),
                      backgroundColor: Colors.grey,
                      action: SnackBarAction(
                        label: 'Kembali',
                        onPressed: (){

                        },
                      ),
                    );
                    Scaffold.of(context).showSnackBar(snackbar);
                  },
                ),
              ],
            ),
            RaisedButton(
              child: Text(
                  "Tes1 dialog bar "
              ),
              color: Colors.blue,
              onPressed: (){
                showDialog(
                    context: context,
                  builder: (BuildContext context)
                    {
                      return AlertDialog(
                        title: Text("ini alert dialog"),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)

                        ),
                        actions: <Widget>[
                          RaisedButton(
                            child: Text("Yes"),
                            onPressed: (){
                              Navigator.pop(context);

                            },
                          )
                        ],
                      );
                    }
                );

              },
            )
          ],
        ),
      ),
    );
  }
}
