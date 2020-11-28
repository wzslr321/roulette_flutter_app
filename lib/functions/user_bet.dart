import 'package:flutter/material.dart';

import 'invest_money.dart';
import '../models/default_text_class.dart';

class UserBet extends StatefulWidget {
  @override
  _UserBetState createState() => _UserBetState();
}

enum possibleBets {
  Black,
  Red,
}

possibleBets userBet;

class _UserBetState extends State<UserBet> {

  void betRed() {
    setState(() {
      userBet = possibleBets.Red;
    });
  }

  void betBlack() {
    setState(() {
      userBet = possibleBets.Black;
    });
  }

  int _moneyInvested = InvestMoney.investedMoney;

  @override
  Widget build(BuildContext context) {

    return (_moneyInvested != 0 && moneyInvested != null) ? Row(
          children:<Widget> [
            InkWell(
              onTap:betBlack,
              child: DefaultTextWidget(
                textContent: 'Bet on black',
              ),
            ),
            InkWell(
              onTap:betRed,
              child: DefaultTextWidget(
                textContent: 'Bet on red',
              ),
            ),
          ],
        ) : Container(
          child: DefaultTextWidget(
            textContent: 'Deposit money to bet!',
          ),
    );
  }
}
