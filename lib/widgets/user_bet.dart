import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/default_text_class.dart';
import '../providers/invested_money_provider.dart';
import '../providers/user_bet_provider.dart';

class UserBet extends StatefulWidget {

  @override
  _UserBetState createState() => _UserBetState();
}


class _UserBetState extends State<UserBet> {
  @override
  Widget build(BuildContext context) {

    UsersBet _usersBet = Provider.of<UsersBet>(context);

    print(_usersBet);

    return Consumer<InvestedMoney>(
      builder: (_,money,__){
        return (money.investedMoney != 0 && money.investedMoney != null )
            ? Row(
          children: <Widget>[
            InkWell(
              onTap:_usersBet.betBlack,
              child: DefaultTextWidget(
                textContent: 'Bet on black',
              ),
            ),
            InkWell(
              onTap:_usersBet.betRed,
              child: DefaultTextWidget(
                textContent: 'Bet on red',
              ),
            ),
          ],
        )
            : Container(
          child: DefaultTextWidget(
            textContent: 'Deposit money to bet!',
          ),
        );
      },);
  }
}
