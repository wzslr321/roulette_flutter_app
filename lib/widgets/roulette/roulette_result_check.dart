import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/default_text_model.dart';
import '../../providers/roulette_providers/user_bet_provider.dart';
import '../../providers/roulette_providers/roulette_state_provider.dart';
import '../../providers/money_providers/available_money_provider.dart';
import '../../providers/money_providers/invested_money_provider.dart';
import './roulette_static_data.dart';

class RouletteResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersBet _usersBet = Provider.of<UsersBet>(context);
    RouletteState _rouletteState = Provider.of<RouletteState>(context);
    Money _userMoney = Provider.of<Money>(context);
    InvestedMoney _investedMoney = Provider.of<InvestedMoney>(context);

    void _didEndOnGreenOrBlack() {
      for (var i = 0; i < greenPartValues.length; i++) {
        if (_rouletteState.itemValue == greenPartValues[i]) {
          _rouletteState.resultIsGreen();
          break;
        }
        _rouletteState.resultIsBlack();
      }
    }

    void _didEndOn() {
      for (var i = 0; i < redPartValues.length; i++) {
        if (_rouletteState.itemValue == redPartValues[i]) {
          _rouletteState.resultIsRed();
          break;
        }
        _didEndOnGreenOrBlack();
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
      _didEndOn();
      _didUserWin();
      assignMoney();
      _usersBet.resetBet();
      _rouletteState.resetEnd();
    }

    return Column(
      children: <Widget>[
        Container(
          color: Colors.green,
          child: DefaultTextWidget(
              textContent: (_rouletteState.isActive == false) &&
                      _investedMoney.investedMoney == 0
                  ? 'Deposit money and try your chances!'
                  : _investedMoney.investedMoney != 0 && _usersBet.bet == null
                      ? 'Bet and start rolling!'
                      : _rouletteState.itemValue == null
                          ? "If you don't click the button, you are already loser"
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
