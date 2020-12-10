import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/default_text_class.dart';
import '../../providers/invested_money_provider.dart';
import '../../providers/user_bet_provider.dart';

class UserBet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersBet _usersBet = Provider.of<UsersBet>(context);

    return Consumer<InvestedMoney>(
      builder: (_, money, __) {
        return (money.investedMoney != 0 && money.investedMoney != null)
            ? Row(
                children: <Widget>[
                  InkWell(
                    onTap: _usersBet.betBlack,
                    child: const DefaultTextWidget(
                      textContent: 'Bet on black',
                    ),
                  ),
                  InkWell(
                    onTap: _usersBet.betRed,
                    child: const DefaultTextWidget(
                      textContent: 'Bet on red',
                    ),
                  ),
                  InkWell(
                    onTap: _usersBet.betGreen,
                    child: const DefaultTextWidget(
                      textContent: 'Bet on gren',
                    ),
                  ),
                ],
              )
            : Container(
                child: const DefaultTextWidget(
                  textContent: 'Deposit money to bet!',
                ),
              );
      },
    );
  }
}
