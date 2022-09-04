import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hello_app/screen/login_screen/loginscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  get ourRouteGenerator => null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Screen",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Login_Screen(),
    );
  }
}
