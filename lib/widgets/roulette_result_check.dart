import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/default_text_class.dart';
import '../providers/user_bet_provider.dart';
import '../providers/roulette_state_provider.dart';
import '../providers/available_money_provider.dart';
import '../providers/invested_money_provider.dart';

class RouletteResult extends StatefulWidget {
  @override
  _RouletteResult createState() => _RouletteResult();
}





class _RouletteResult extends State<RouletteResult> {
  @override
  Widget build(BuildContext context) {

    Money _userMoney = Provider.of<Money>(context);
    InvestedMoney _investedMoney = Provider.of<InvestedMoney>(context);

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
          ((didEndOnRed() == false) && (_usersBet.bet == possibleBets.Black)))) {
        _userMoney.addMoney(_investedMoney.amount);
        _investedMoney.resetInvestmentMoney();
        return true;
      }
      return false;
    }

    if(_rouletteState.isFinished == true){
      print('test');
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
                  : _isWinner == null ?
              'You...'
                  : _isWinner != false ? 'You won!' : 'You lost'),
        ),
      ],
    );
  }
}