import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:login/register.dart';

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FLutter login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: OutlineButton(
              onPressed: () {
                _push(context, Login());
              },
              child: Text("login"),
              padding: EdgeInsets.all(16.0),
            ),
          ),
          SizedBox(
            height : 30.0
          ),
          Container(
            alignment: Alignment.center,
            child: OutlineButton(
              onPressed: () {
                _push(context, Register());
              },
              child: Text("Register"),
              padding: EdgeInsets.all(16.0),
            ),
          ),
        ],
      ),
    );
  }

  void _push(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return page;
    }));
  }
}
