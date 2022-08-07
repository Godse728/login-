// ignore_for_file: use_key_in_widget_constructors

import 'package:first_app/RowColomn.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "First App",
      home: RowColomn(),
    );
  }
}
