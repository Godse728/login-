// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Pageviewscreen extends StatelessWidget {
  var hello = [
    Colors.red,
    Colors.white,
    Colors.green,
    Colors.black,
    Colors.orangeAccent,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: hello.length,
            itemBuilder: (context, index) {
              return Container(
                color: hello[index],
              );
            }));
  }
}
