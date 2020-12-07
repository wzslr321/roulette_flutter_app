import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import '../../models/default_text_class.dart';
import '../../providers/roulette_state_provider.dart';
import './roulette_static_data.dart';
import './roulette_pie_widget.dart';

class RouletteAnimation extends StatefulWidget {
  @override
  RouletteAnimationState createState() => RouletteAnimationState();
}

class RouletteAnimationState extends State<RouletteAnimation>
    with TickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;

  Animation _animationAlignment;
  AnimationController _animationAlignmentController;

  void _assignTweenValueToResult() {
    for(var i = 1; i <= colorMaxValues.length; i++){
      if(_rouletteState.tweenValue.round() == i){
        if(_rouletteState.tweenValue.round() != 0) {
          int tweenRandMax = colorMaxValues[i - 1][i.toDouble()];
          int randTweenValue = new Random().nextInt(125) + (tweenRandMax - 125);
          _rouletteState.setTweenVal(randTweenValue);
        }
      }
    }
  }

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

  void _setNewValuesOnRoll() {
    _rouletteState.setTweenVal(0);
    _rouletteState.resetWinner();
    _rouletteState.start();
  }

  void roll() {
    _setNewValuesOnRoll();
    _assignTweenValueToResult();
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
        _rouletteState.end();
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

  RouletteState _rouletteState;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    RouletteState _stateProvider = Provider.of<RouletteState>(context);

    _rouletteState = _stateProvider;

    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    if (_stateProvider.tweenValue != null) {
      _animation = Tween(begin: -1.0, end: _rouletteState.tweenValue.roundToDouble() + 15)
          .animate(_animation);
    }

    _animationAlignment = CurvedAnimation(
        parent: _animationAlignmentController, curve: Curves.elasticInOut);
    _animationAlignment =
        Tween(begin: 0.0, end: 1.0).animate(_animationAlignment);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.00),
      ),
      width: queryData.size.width * 0.5,
      child: Column(
        children: <Widget>[
          RoulettePie(
            animationAlignment: _animationAlignment,
            spinAnimation: _animation,
          ),
          SizedBox(
            height: queryData.size.height * 0.02,
            width: queryData.size.width * 0.005,
            child: Container(
              color: Colors.black,
            ),
          ),
          Container(
            width: queryData.size.width * 0.2,
            child: ElevatedButton(
                onPressed: () {
                  roll();
                  alignmentAnimate();
                },
                child: const DefaultTextWidget(
                  textContent: 'Roll!',
                )),
          )
        ],
      ),
    );
  }
}
