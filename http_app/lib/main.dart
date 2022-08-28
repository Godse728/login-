import 'package:flutter/material.dart';
import 'package:http_app/http/homepage.dart';
import 'package:http_app/http/httpuse.dart';
import 'package:http_app/model/instaUI.dart';
import 'package:http_app/model/userUI.dart';
void main() {
  runApp(HttpApp());
}

class HttpApp extends StatelessWidget {
  const HttpApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
title: "Http App",
theme: ThemeData(
  primarySwatch: Colors.green,
),
home: Insta_UI(),
    );
  }
}