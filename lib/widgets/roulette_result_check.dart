import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/default_text_class.dart';
import '../providers/user_bet_provider.dart';
import 'roulette_animations.dart';

class RouletteResult extends StatefulWidget {
  @override
  _RouletteResult createState() => _RouletteResult();
}

bool _didStart = RouletteAnimation.isActive;
bool _didEnd = RouletteAnimation.isFinished;
double _tweenVal = RouletteAnimation.tweenVal;

bool didEndOnRed() {
  String _convertedTweenVal = _tweenVal.toString();
  if (int.parse(_convertedTweenVal[3]) < 5) return true;
  return false;
}



class _RouletteResult extends State<RouletteResult> {
  @override
  Widget build(BuildContext context) {
    UsersBet _usersBet = Provider.of<UsersBet>(context);

    bool didUserWin() {
      if ((((didEndOnRed()) && (_usersBet.bet == possibleBets.Red)) ||
          ((didEndOnRed() == false) && (_usersBet.bet == possibleBets.Black))))
        return true;
      return false;
    }

    return Column(
      children: <Widget>[
        Container(
          color: Colors.green,
          child: DefaultTextWidget(
              textContent: _didStart == false
                  ? 'Try your chances!'
                  : _didEnd == false
                      ? 'You...'
                      : () => didUserWin() ? 'You won!' : 'You lost'),
        ),
      ],
    );
  }
}
