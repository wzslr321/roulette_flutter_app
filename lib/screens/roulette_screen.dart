import 'package:flutter/material.dart';
import 'dart:math';

import '../widgets/roulette_item.dart';
import '../models/default_text_class.dart';

class RouletteScreen extends StatefulWidget {
  static const routeName = '/roulette';

  @override
  _RouletteScreenState createState() => _RouletteScreenState();
}
enum possibleBets{
  Black,
  Red,
}

class _RouletteScreenState extends State<RouletteScreen>
    with TickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;

  bool didWin;
  bool didEnd;
  bool didStart = false;
  bool isRedOnTween;
  possibleBets userBet;

  void _roll() {
    tweenEnd = 0;
    didStart = true;
    isRedOnTween = null;
    didWin = null;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
      value: 0.1,
      lowerBound: 0.0,
      upperBound: 1.0,
    );
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        _animationController.forward();
        setState(() {
          String _convertedTween = tweenEnd.toString();
          int.parse(_convertedTween[3]) < 5
              ? isRedOnTween = true
              : isRedOnTween = false;
         (((isRedOnTween == true) && (userBet == possibleBets.Red)) || ((isRedOnTween == false) && (userBet == possibleBets.Black))) == true ? didWin = true : didWin = false;
        });
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
  }

  @override
  dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void betRed() {
    setState(() {
      userBet = possibleBets.Red;
    });
  }
  void betBlack() {
    setState(() {
      userBet = possibleBets.Black;
    });
  }

  double tweenEnd = 0;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    if (tweenEnd == 0) {
      tweenEnd = new Random().nextInt(100) / 10 + 20;
    }
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _animation = Tween(begin: -1.0, end: tweenEnd).animate(_animation);

    return Container(
      width: queryData.size.width,
      height: queryData.size.height,
      child: Center(
          child: Column(
        children: <Widget>[
          RotationTransition(
            turns: _animation,
            child: Container(
                width: queryData.size.width * 0.5,
                height: queryData.size.height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.00),
                ),
                child: Row(
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
          InkWell(
              onTap: _roll,
              child: Container(
                child: Text("tap"),
              )),
          Container(
            color: Colors.green,
            child: DefaultTextWidget(
              textContent: didWin == null
                  ? didStart
                      ? 'You...'
                      : 'Try your chances!'
                  : didWin
                      ? 'You won!'
                      : 'You lost'
            ),
          ),
          InkWell(
            onTap:() {
              betBlack(); _roll();
            },
            child:DefaultTextWidget(
              textContent:'Bet on black',
            ),
          ),
          InkWell(
            onTap:() {
              betRed(); _roll();
            },
            child:DefaultTextWidget(
              textContent:'Bet on red',
            ),
          )
          // Transform(
          //   alignment: FractionalOffset(0.5,0.0),
          //   transform: Matrix4.rotationZ(_animation.value),
          //   child: Container(
          //     child:Text("!!!!!!!"),
          //   ),
          // )
        ],
      )),
    );
  }
}
