import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/homepage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(" login Page"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          emailAndPassword(),
        ],
      ),
    );
  }

  Widget emailAndPassword() {
    return Form(
        key: _formKey,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Sign In With Email and Pasword",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                  validator: (value) {
                    return value.isEmpty ? "Input the  proper email" : null;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                  validator: (value) {
                    return value.isEmpty ? "Input the  proper email" : null;
                  },
                ),
                Container(
                  padding: EdgeInsets.only(top: 16.0),
                  alignment: Alignment.center,
                  child: OutlineButton(
                    child: Text("SIgn In"),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _signInWithEmailAndPassword();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void _signInWithEmailAndPassword() async {
    try {
      final User _user = (await _auth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text))
          .user;
      if (!_user.emailVerified) {
        await _user.sendEmailVerification();
      }
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return Home(user: _user);
      }));
    } catch (e) {
      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text("Failed to sign in with email and password")));
      print(e.message);
    }
  }
}
