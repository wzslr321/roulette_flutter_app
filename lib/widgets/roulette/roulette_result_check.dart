import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/default_text_class.dart';
import '../../providers/user_bet_provider.dart';
import '../../providers/roulette_state_provider.dart';
import '../../providers/available_money_provider.dart';
import '../../providers/invested_money_provider.dart';

class RouletteResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersBet _usersBet = Provider.of<UsersBet>(context);
    RouletteState _rouletteState = Provider.of<RouletteState>(context);
    Money _userMoney = Provider.of<Money>(context);
    InvestedMoney _investedMoney = Provider.of<InvestedMoney>(context);

    int _comparableVal;

    if (_rouletteState.tweenValue != null && _rouletteState.tweenValue != 0.0) {
      String _convertedTweenVal = _rouletteState.tweenValue.toString();
      _comparableVal = int.parse(_convertedTweenVal.substring(3, 6));
    }

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
        if (_comparableVal > _redPartValues[i] &&
            _comparableVal < _redPartValues[i + 1]) {
          _rouletteState.resultIsRed();
          print(_comparableVal);
          print(_redPartValues[i]);
          print(_redPartValues[i + 1]);
          break;
        }
      }
    }

    void _didEndOnGreen() {
      List<int> _greenPartValues = [375, 500, 875, 1000];
      for (var i = 0; i < _greenPartValues.length - 1; i += 2) {
        if (_comparableVal > _greenPartValues[i] &&
            _comparableVal < _greenPartValues[i + 1]) {
          _rouletteState.resultIsGreen();
          break;
        }
      }
    }

    void _didEndOnBlack() {
      if (_rouletteState.rouletteResult != rouletteColorResult.Red) {
        if (_rouletteState.rouletteResult != rouletteColorResult.Green) {
          _rouletteState.resultIsBlack();
        }
      }
    }

    void _didUserWin() {
      if (_rouletteState.rouletteResult == _usersBet.bet) {
        _rouletteState.setWinner();
      } else {
        _rouletteState.setLoser();
      }
    }

    void assignMoney() {
      if (_rouletteState.isWinner == true) {
        _userMoney.addMoney(_investedMoney.amount * 2);
        _investedMoney.resetInvestmentMoney();
      } else {
        _investedMoney.resetInvestmentMoney();
      }
    }

    if (_rouletteState.isFinished == true) {
      _didEndOnRed();
      _didEndOnGreen();
      _didEndOnBlack();
      _didUserWin();
      assignMoney();
      _rouletteState.resetEnd();
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
