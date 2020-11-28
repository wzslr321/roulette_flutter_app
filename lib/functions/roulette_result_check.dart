import 'package:flutter/material.dart';

import '../models/default_text_class.dart';
import './invest_money.dart';
import 'roulette_animations.dart';

class BetOnRoulette extends StatefulWidget {
  @override
  _BetOnRouletteState createState() => _BetOnRouletteState();
}

bool _didStart = RouletteAnimation.isActive;
bool _didEnd = RouletteAnimation.isFinished;
double _tweenVal = RouletteAnimation.tweenVal;

bool didEndOnRed(){
  String _convertedTweenVal = _tweenVal.toString();
  if(int.parse(_convertedTweenVal[3]) < 5)
    return true;
  return false;
}

bool didUserWin(){
  if(_didEnd == true){

  };
}
bool _didWin;

class _BetOnRouletteState extends State<BetOnRoulette> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        Container(
          color: Colors.green,
          child: DefaultTextWidget(
              textContent: _didWin == null
                  ? _didStart
                  ? 'You...'
                  : 'Try your chances!'
                  : _didWin
                  ? 'You won!'
                  : 'You lost'),
        ),
      ],
    );
  }
}
