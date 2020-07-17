import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ValueChangingAnimation extends StatefulWidget {
  @override
  _ValueChangingAnimationState createState() => _ValueChangingAnimationState();
}

class _ValueChangingAnimationState extends State<ValueChangingAnimation>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
    animation = IntTween(begin: 10, end: 0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Center(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Loading...',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey)),
                Text(animation.value.toString(),
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey))
              ],
            ),
          )),
        );
      },
    );
  }

  @override
  dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }
}
