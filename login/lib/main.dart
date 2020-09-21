import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/logindemo.dart';

Future <void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginDemo(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}