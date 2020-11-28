import 'package:flutter/material.dart';
import 'package:shopping_helper/models/default_text_class.dart';
import 'dart:math';

import '../widgets/roulette_item.dart';

class RouletteAnimation extends StatefulWidget {

  static bool isActive = didStart;
  static bool isFinished = didEnd;
  static double tweenVal = tweenEnd;

  @override
  RouletteAnimationState createState() => RouletteAnimationState();
}

bool didStart = false;
bool didEnd = false;
double tweenEnd = 0;

class RouletteAnimationState extends State<RouletteAnimation>
    with TickerProviderStateMixin {

  Animation _animation;
  AnimationController _animationController;

  Animation _animationAlignment;
  AnimationController _animationAlignmentController;

  void alignmentAnimate() {
    _animationAlignmentController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _animationAlignmentController.addListener(() {
      if (_animationAlignmentController.isCompleted) {
        _animationAlignmentController.reverse();
      }
    });
    _animationAlignmentController.forward();
  }

  void roll() {
    tweenEnd = 0;
    didStart = true;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
      value: 0.1,
      lowerBound: 0.0,
      upperBound: 1.0,
    );
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        didEnd = true;
        _animationController.forward();
      } else {
        _animationController.isDismissed
            ? _animationController.forward()
            : setState(() {});
      }
    });

    _animationController.forward();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _animationAlignmentController = AnimationController(vsync: this);
  }

  @override
  dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    print(didStart);
    print(tweenEnd);

    MediaQueryData queryData = MediaQuery.of(context);

    if (tweenEnd == 0) {
      tweenEnd = new Random().nextInt(100) / 10 + 20;
    }
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _animation = Tween(begin: -1.0, end: tweenEnd).animate(_animation);

    _animationAlignment = CurvedAnimation(parent: _animationAlignmentController, curve: Curves.elasticInOut);
    _animationAlignment = Tween(begin: 0.0, end: 1.0).animate(_animationAlignment);

    return Column(
      children:<Widget> [
        Transform(
          alignment: FractionalOffset(2.0, 0.0),
          transform: Matrix4.rotationZ(_animationAlignment.value),
          child: RotationTransition(
            turns: _animation,
            child: Container(
                width: queryData.size.width * 0.5,
                height: queryData.size.height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.00),
                ),
                child:
                    Row(
                      children: <Widget>[
                        RouletteItem(
                          'X2',
                          Colors.black,
                          BorderRadius.only(
                              topLeft: Radius.circular(100),
                              bottomLeft: Radius.circular(100)),
                        ),
                        RouletteItem(
                          'X2',
                          Colors.red,
                          BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100)),
                        ),
                      ],
                )),
          ),
        ),
        Container(
          width: 100,
          child: ElevatedButton(
              onPressed:() {
                 roll();alignmentAnimate();
              },
              child: DefaultTextWidget(
                textContent: 'Roll!',
              )
          ),
        )
      ],
    );
  }
}