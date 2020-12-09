import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/default_text_model.dart';
import '../providers/money_providers/available_money_provider.dart';
import '../providers/money_providers/invested_money_provider.dart';
import '../providers/roulette_providers/roulette_state_provider.dart';

class MoneyStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Money _userMoney = Provider.of<Money>(context);
    InvestedMoney _investedMoney = Provider.of<InvestedMoney>(context);
    RouletteState _rouletteState = Provider.of<RouletteState>(context);



    return Column(
      children: <Widget>[
        Container(
            child: DefaultTextWidget(
                textContent: _investedMoney.investedMoney == null
                    ? 'Your money deposit is empty'
                    : 'You have ${_investedMoney.investedMoney}\$ in deposit')),
        Container(
          child: DefaultTextWidget(
              textContent: 'You have ${_userMoney.quantity}\$ total'),
        ),
        _rouletteState.isFinished == true
            ? ElevatedButton(
                onPressed: () {
                  _rouletteState.resetEnd();
                },
                child: const Text("Roger that"),
              )
            : const SizedBox()
      ],
    );
  }
}
