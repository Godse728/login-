// ignore_for_file: use_key_in_widget_constructors

import 'package:first_app/bubble/carauiel.dart';
import 'package:first_app/bubble/swipe_page.dart';
import 'package:first_app/tiktokUI/tiktok.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "First App",
      home: Tiktok(),
    );
  }
}
