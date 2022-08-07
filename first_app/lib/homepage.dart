// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // only one in one screen.
        appBar: AppBar(
        
        ),
        
        bottomNavigationBar: Container(
          color: Colors.blue,
          height: 44,
          width: 44,
        ),
        body: Container(
          color: Colors.green,
         height: 200,
         width: 200,
         alignment: Alignment.center,
          child: Container(
            color: Colors.brown,
            height: 150,
            width: 150,  
            
          )
        ));
  }
}
