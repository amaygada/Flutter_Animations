import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Gestures extends StatefulWidget {
  @override
  _GesturesState createState() => _GesturesState();
}

class _GesturesState extends State<Gestures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onLongPress: () {
            print('gesture detected');
          },
          child: Container(
            width: 100,
            height: 50,
            padding: EdgeInsets.all(10.0),
            child: Center(child: Text('Gesture')),
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(17.0)),
          ),
        ),
      ),
    );
  }
}
