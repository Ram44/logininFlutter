import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/logindemo.dart';

class Home extends StatelessWidget {
  final User user;
  Home({Key key, this.user}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldState=GlobalKey<ScaffoldState>();
  final FirebaseAuth  _auth=FirebaseAuth.instance;

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(Widget.user.displayName,style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
            ),
            Container(
              child: OutlineButton(onPressed: ()async{
                signOut().whenComplete((){
                  Navigator.push(context, MaterialPageRoute(builder: (_){
                        return LoginDemo();
                  }));
                });
              },
              child: Text("Log Out"),
              ),
            )
          ]
        ),
      ),
      
    );
  }
 Future signOut()async{
    await _auth.signOut();

  }
}