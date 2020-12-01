import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/default_text_class.dart';
import '../../providers/user_bet_provider.dart';
import '../../providers/roulette_state_provider.dart';

class RouletteResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersBet _usersBet = Provider.of<UsersBet>(context);
    RouletteState _rouletteState = Provider.of<RouletteState>(context);

    void _didEndOnRed() {
      List<int> _redPartValues = [
        125,
        250,
        375,
        500,
        750,
        875,
      ];
      String _convertedTweenVal = _rouletteState.tweenValue.toString();
      int _comparableVal = int.parse(_convertedTweenVal.substring(3, 6));
      for (var i = 0; i < _redPartValues.length - 1; i+=2) {
          if (_comparableVal > _redPartValues[i] &&
              _comparableVal < _redPartValues[i + 1]) {
            _rouletteState.resultIsRed();
            break;
          }
      }
    }

    void _didUserWin() {
      if ((_rouletteState.isResultRed == true) &&
          (_usersBet.bet == possibleBets.Red)) {
        _rouletteState.setWinner();
      } else if ((_rouletteState.isResultRed == false) &&
          (_usersBet.bet == possibleBets.Black)) {
        _rouletteState.setWinner();
      } else {
        _rouletteState.setLoser();
      }
    }

    if (_rouletteState.isFinished == true) {
      _didEndOnRed();
      _didUserWin();
    }

    return Column(
      children: <Widget>[
        Container(
          color: Colors.green,
          child: DefaultTextWidget(
              textContent: _rouletteState.isActive == false
                  ? 'Try your chances!'
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
