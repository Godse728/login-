import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Swipe extends StatelessWidget {
  List<Color> colors = [
    Colors.red,
    Colors.white,
    Colors.black,
    Colors.blue,
    Colors.red,
    Colors.white,
    Colors.black,
    Colors.blue,
    Colors.red,
    Colors.white,
    Colors.black,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Container(color: colors[index]);
        },
      ),
    );
  }
}
