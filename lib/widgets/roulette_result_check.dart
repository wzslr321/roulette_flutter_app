import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/default_text_class.dart';
import '../providers/user_bet_provider.dart';
import '../providers/roulette_state_provider.dart';

class RouletteResult extends StatefulWidget {
  @override
  _RouletteResult createState() => _RouletteResult();
}





class _RouletteResult extends State<RouletteResult> {
  @override
  Widget build(BuildContext context) {

    UsersBet _usersBet = Provider.of<UsersBet>(context);
    RouletteState _rouletteState = Provider.of<RouletteState>(context);



    bool didEndOnRed() {
      String _convertedTweenVal = _rouletteState.tweenValue.toString();
      if (int.parse(_convertedTweenVal[3]) < 5) return true;
      return false;
    }

    bool _isWinner;

    bool didUserWin() {
      if ((((didEndOnRed()) && (_usersBet.bet == possibleBets.Red)) ||
          ((didEndOnRed() == false) && (_usersBet.bet == possibleBets.Black))))
        return true;
      return false;
    }

    if(_rouletteState.didEnd == true){
      didEndOnRed();
      didUserWin() ? _isWinner = true : _isWinner  = false;
    }

    return Column(
      children: <Widget>[
        Container(
          color: Colors.green,
          child: DefaultTextWidget(
              textContent: _rouletteState.didStart == false
                  ? 'Try your chances!'
                  : _rouletteState.didEnd == false
                      ? 'You...'
                      : _isWinner == null ?
                          'You...'
                          : _isWinner != false ? 'You won!' : 'You lost'),
        ),
      ],
    );
  }
}
