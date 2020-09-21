import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Form(
        key: _formKey,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Input Full Name",
                      hintText: "Name",
                    ),
                    validator: (String value) {
                      return value.isEmpty ? " Input the Name" : null;
                    }),
                TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Input Full Email",
                      hintText: "Email",
                    ),
                    validator: (String value) {
                      return value.isEmpty ? " Input the Email  " : null;
                    }),
                TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Input Full Password",
                      hintText: "Password",
                    ),
                    validator: (String value) {
                      return value.isEmpty ? " Input the Password" : null;
                    }),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: OutlineButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        
                      }
                    },
                    child: Text("Register"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
