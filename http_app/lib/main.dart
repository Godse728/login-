import 'package:flutter/material.dart';


import 'http/posts.dart';
void main() {
  runApp(HttpApp());
}

class HttpApp extends StatelessWidget {
  const HttpApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
title: "Http App",
// theme: ThemeData(
//   primarySwatch: Colors.green,
// ),
home: DataFetchInstaPost(),
    );
  }
}