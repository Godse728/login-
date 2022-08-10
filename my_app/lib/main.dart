import 'package:flutter/material.dart';
import 'package:my_app/follower/Followers.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "First App",
      home: Followers(),
    );
  }
}
