import 'package:flutter/material.dart';
import 'package:my_app/form/form_bar.dart';
import 'package:my_app/form/login_bar.dart';
import 'package:my_app/form/signup_page.dart';
import 'package:my_app/navagation/customroute.dart';
import 'package:my_app/stful_wid/bottom_nav.dart';

import 'navagation/navscreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  get ourRouteGenerator => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Screen",
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: NavigationScreen(),
      onGenerateRoute: ourRouteGenerator,
    );
  }
}
