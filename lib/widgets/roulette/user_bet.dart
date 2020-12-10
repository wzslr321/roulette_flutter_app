import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/default_text_class.dart';
import '../../providers/invested_money_provider.dart';
import '../../providers/user_bet_provider.dart';

class UserBet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersBet _usersBet = Provider.of<UsersBet>(context);
    MediaQueryData _queryData = MediaQuery.of(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: _queryData.size.height * 0.035),
      child: Consumer<InvestedMoney>(
        builder: (_, money, __) {
          return (money.investedMoney != 0 && money.investedMoney != null)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: _usersBet.betBlack,
                      child: const DefaultTextWidget(
                        fontSize: 17,
                        textContent: 'Bet on black',
                      ),
                    ),
                    InkWell(
                      onTap: _usersBet.betRed,
                      child: const DefaultTextWidget(
                        fontColor: Colors.red,
                        fontSize: 17,
                        textContent: 'Bet on red',
                      ),
                    ),
                    InkWell(
                      onTap: _usersBet.betGreen,
                      child: const DefaultTextWidget(
                        fontColor: Colors.green,
                        fontSize: 17,
                        textContent: 'Bet on green',
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
      ),
    );
  }
}
