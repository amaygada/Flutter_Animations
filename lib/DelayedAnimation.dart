import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class DelayedAnimation extends StatefulWidget {
  @override
  _DelayedAnimationState createState() => _DelayedAnimationState();
}

class _DelayedAnimationState extends State<DelayedAnimation>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, veryDelayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 4), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    veryDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    print('hello');
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Transform(
              transform:
                  Matrix4.translationValues(animation.value * width, 0, 0),
              child: Center(child: Container(child: Text('Text 1'))),
            ),
            Transform(
              transform: Matrix4.translationValues(
                  delayedAnimation.value * width, 0, 0),
              child: Center(child: Container(child: Text('Text 2'))),
            ),
            Transform(
              transform: Matrix4.translationValues(
                  veryDelayedAnimation.value * width, 0, 0),
              child: Center(child: Container(child: Text('Text 3'))),
            )
          ],
        ));
      },
    );
  }
}
