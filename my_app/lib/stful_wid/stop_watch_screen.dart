import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StopWatchScreen extends StatefulWidget {
  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  late Stopwatch stopwatch;
  late Timer t;
  void handleStartStop() {
    if (stopwatch.isRunning) {
      stopwatch.stop();
    } else {
      stopwatch.start();
    }
  }

  String returnFormattedText() {
    var milli = stopwatch.elapsed.inMilliseconds;
    String milliseconds = (milli % 1000).toString().padLeft(3, "0");
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");
    return "$minutes:$seconds:$milliseconds";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
    t = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: () {
                  handleStartStop();
                },
                padding: EdgeInsets.all(0),
                child: Container(
                  height: 250,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xff0395eb),
                        width: 4,
                      )),
                  child: Text(
                    returnFormattedText(),
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 33,
                  width: 120,
                  child: CupertinoButton(
                    onPressed: () {
                      stopwatch.reset();
                    },
                    padding: EdgeInsets.all(0),
                    child: Text('Reset',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
