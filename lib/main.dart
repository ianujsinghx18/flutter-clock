import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;
import 'binarytime.dart';
import 'clockcolumn.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(ClockApp());
}

class ClockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
          display1: TextStyle(color: Colors.black38, fontSize: 30),
        ),
        fontFamily: 'Alatsi',
      ),
      home: Scaffold(
        body: Clock(),
      ),
    );
  }
}

class Clock extends StatefulWidget {
  Clock({Key key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  BinaryTime _now = BinaryTime();

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (v) {
      setState(() {
        _now = BinaryTime();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  _now.day,
                  style: TextStyle(color: Color(0XffF1E7D0), fontSize: 20),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClockColumn(
                binaryInteger: _now.hourTens,
                title: 'H',
                color: Colors.blue,
                rows: 2,
              ),
              ClockColumn(
                binaryInteger: _now.hourOnes,
                title: 'h',
                color: Colors.lightBlue,
              ),
              ClockColumn(
                binaryInteger: _now.minuteTens,
                title: 'M',
                color: Colors.green,
                rows: 3,
              ),
              ClockColumn(
                binaryInteger: _now.minuteOnes,
                title: 'm',
                color: Colors.lightGreen,
              ),
              ClockColumn(
                binaryInteger: _now.secondTens,
                title: 'S',
                color: Colors.pink,
                rows: 3,
              ),
              ClockColumn(
                binaryInteger: _now.secondOnes,
                title: 's',
                color: Colors.pinkAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
