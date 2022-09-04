// ignore_for_file: deprecated_member_use, unnecessary_null_comparison

import 'dart:async';

import 'package:flutter/material.dart';

class FullScreen extends StatefulWidget {
  const FullScreen({Key? key}) : super(key: key);

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  int _counter = 10;
  late Timer _timer;
  void startTimer() {
    _counter = 10;

    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (_timer) {
      setState(() {
        if (_counter < 0) {
          _counter--;
          startTimer();
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        _timer.cancel();
      }),
      appBar: AppBar(
        title: Text('Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (_counter > 0)
                ? Text(
                    'Done!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 9, 178, 207),
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Text(
                    '$_timer',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
            RaisedButton(
              onPressed: () {
                startTimer();
              },
              child: Text('Start 60 seconds count down.'),
            ),
          ],
        ),
      ),
    );
  }
}
