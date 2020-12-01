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

    String _convertedTweenVal = _rouletteState.tweenValue.toString();
    print(_convertedTweenVal);
    //int _comparableVal = int.parse(_convertedTweenVal.substring(3, 6));

    void _didEndOnRed() {
      List<int> _redPartValues = [
        125,
        250,
        500,
        625,
        750,
        875,
      ];
      for (var i = 0; i < _redPartValues.length - 1; i += 2) {
        // if (_comparableVal > _redPartValues[i] &&
        //     _comparableVal < _redPartValues[i + 1]) {
        //   _rouletteState.resultIsRed();
        //   break;
        // }
      }
    }

    void _didEndOnGreen(){
      List<int> _greenPartValues = [
         375,
         500,
         875,
         1000
      ];
      for (var i = 0; i < _greenPartValues.length - 1; i += 2) {
        // if (_comparableVal > _greenPartValues[i] &&
        //     _comparableVal < _greenPartValues[i + 1]) {
        //   _rouletteState.resultIsGreen();
        //   break;
        // }
      }
    }

    void _didEndOnBlack() {
      if(_rouletteState.rouletteResult != rouletteColorResult.Red){
        if(_rouletteState.rouletteResult != rouletteColorResult.Green){
          _rouletteState.resultIsBlack();
        }
      }
    }

    void _didUserWin() {
      if (_rouletteState.rouletteResult == _usersBet.bet){
        _rouletteState.setWinner();
      } else {
        _rouletteState.setLoser();
      }
    }

    if (_rouletteState.isFinished == true) {
      _didEndOnRed();
      _didEndOnGreen();
      _didEndOnBlack();
      _didUserWin();
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
