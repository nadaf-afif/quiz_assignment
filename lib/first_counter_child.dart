import 'dart:async';

import 'package:flutter/material.dart';

class FirstCounterChild extends StatefulWidget {
  Function onCounterCompleted;
  FirstCounterChild({
    Key key,
    @required this.onCounterCompleted,
  }) : super(key: key);

  @override
  _FirstCounterChildState createState() => _FirstCounterChildState();
}

class _FirstCounterChildState extends State<FirstCounterChild> {
  Timer _timer;
  int _startCount = 3;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_startCount == 1) {
        _timer.cancel();
        widget.onCounterCompleted();
      } else {
        setState(() {
          _startCount--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      startTimer();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Get Ready!",
            style: TextStyle(
                color: Colors.white,
                fontSize: 32.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 30.0),
        Center(
          child: Text(
            "$_startCount",
            style: TextStyle(
                color: Colors.white,
                fontSize: 120.0,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
