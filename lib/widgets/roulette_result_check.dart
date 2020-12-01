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

    void _didEndOnRed() {
      String _convertedTweenVal = _rouletteState.tweenValue.toString();
      if (int.parse(_convertedTweenVal[3]) < 5) _rouletteState.resultIsRed();
      _rouletteState.resultIsBlack();
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
