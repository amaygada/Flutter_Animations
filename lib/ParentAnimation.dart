import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class ParentAnimations extends StatefulWidget {
  @override
  _ParentAnimationsState createState() => _ParentAnimationsState();
}

class _ParentAnimationsState extends State<ParentAnimations>
    with SingleTickerProviderStateMixin {
  Animation animation, childAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween(begin: 0.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));

    childAnimation = Tween(begin: 0.0, end: 125.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Align(
            alignment: Alignment.center,
            child: Container(
              color: Colors.green,
              height: 250,
              width: 250,
              child: Transform(
                transform:
                    Matrix4.translationValues(animation.value * width, 0, 0),
                child: Center(
                  child: AnimatedBuilder(
                    animation: childAnimation,
                    builder: (BuildContext context, Widget child) {
                      return new Center(
                        child: Container(
                            height: childAnimation.value * 2,
                            width: childAnimation.value * 2,
                            child: Container(
                              color: Colors.blueAccent,
                            )),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
