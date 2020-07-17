import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class TransformationAnimation extends StatefulWidget {
  @override
  _TransformationAnimationState createState() =>
      _TransformationAnimationState();
}

class _TransformationAnimationState extends State<TransformationAnimation>
    with SingleTickerProviderStateMixin {
  Animation animation, transformationAnim;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween(begin: 10.0, end: 200.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease));
    transformationAnim = BorderRadiusTween(
            begin: BorderRadius.circular(125.0),
            end: BorderRadius.circular(0.0))
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.ease));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Center(
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomCenter,
                  height: animation.value,
                  width: animation.value,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: transformationAnim.value),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
