import 'dart:async';

import 'package:flutter/material.dart';

Timer timer;

class SecTimer extends StatefulWidget {
  SecTimer({Key key}) : super(key: key);

  @override
  _SecTimerState createState() => _SecTimerState();
}

class _SecTimerState extends State<SecTimer> {
  int secs = 0;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    secs = 0;

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        secs++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$secs',
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
