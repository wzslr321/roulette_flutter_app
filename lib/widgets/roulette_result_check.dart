import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/default_text_class.dart';
import '../providers/user_bet_provider.dart';
import '../providers/roulette_state_provider.dart';


class RouletteResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    UsersBet _usersBet = Provider.of<UsersBet>(context);
    RouletteState _rouletteState = Provider.of<RouletteState>(context);

    void didEndOnRed() {
      String _convertedTweenVal = _rouletteState.tweenValue.toString();
      print(_convertedTweenVal);
      if (int.parse(_convertedTweenVal[3]) < 5) _rouletteState.resultIsRed();
      _rouletteState.resultIsBlack();
    }

    void didUserWin() {
      if ((((_rouletteState.isResultRed == true) && (_usersBet.bet == possibleBets.Red)) ||
          ((_rouletteState.isResultRed == false) && (_usersBet.bet == possibleBets.Black)))) {
        print(_rouletteState.isResultRed);
        print(_usersBet.bet);
        _rouletteState.setWinner();
      } else {
        _rouletteState.setLoser();
      }
    }


    if (_rouletteState.isFinished == true) {
      didEndOnRed();
      didUserWin();
    }

    return Column(
      children: <Widget>[
        Container(
          color: Colors.green,
          child: DefaultTextWidget(
              textContent: _rouletteState.isActive == false
                  ? 'Try your chances!'
                  : _rouletteState.isFinished == false
                      ? 'You...'
                      : _rouletteState.isWinner == null
                          ? 'You...'
                          : _rouletteState.isWinner != false
                              ? 'You won!'
                              : 'You lost'),
        ),
      ],
    );
  }
}
