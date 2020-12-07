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

    void _didEndOnRed() {
      List<double> _redPartValues = [
        2.0,
        5.0,
        7.0,
      ];
      for (var i = 0; i < _redPartValues.length - 1; i++) {
        if (_rouletteState.itemValue == _redPartValues[i]) {
          print(_rouletteState.itemValue);
          print("RED");
          _rouletteState.resultIsRed();
          break;
        }
      }
    }

    void _didEndOnGreen() {
      List<double> _greenPartValues = [4.0,9.0];
      for (var i = 0; i < _greenPartValues.length - 1; i ++) {
        if (_rouletteState.itemValue == _greenPartValues[i] ) {
          print(_rouletteState.itemValue);
          print("GREEN");
          _rouletteState.resultIsGreen();
          break;
        }
      }
    }

    void _didEndOnBlack() {
      if (_rouletteState.rouletteResult != rouletteColorResult.Red) {
        if (_rouletteState.rouletteResult != rouletteColorResult.Green) {
          print(_rouletteState.itemValue);
          print("BLACK");
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
