import 'package:animations/DelayedAnimation.dart';
import 'package:animations/GestureDetector.dart';
import 'package:animations/ParentAnimation.dart';
import 'package:animations/TransformationAnimation.dart';
import 'package:animations/ValueChangingAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

import 'Animations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Navigate(),
    );
  }
}

class Navigate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Demos'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Animation'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
              ),
              RaisedButton(
                child: Text('Guesture Detector'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Gestures()));
                },
              ),
              RaisedButton(
                child: Text('Delayed Animation'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DelayedAnimation()));
                },
              ),
              RaisedButton(
                child: Text('Parent Animation'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ParentAnimations()));
                },
              ),
              RaisedButton(
                child: Text('Transformation Animation'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TransformationAnimation()));
                },
              ),
              RaisedButton(
                child: Text('Value Changing Animation'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ValueChangingAnimation()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
