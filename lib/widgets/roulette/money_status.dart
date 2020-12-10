import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/default_text_class.dart';
import '../../providers/available_money_provider.dart';
import '../../providers/invested_money_provider.dart';
import '../../providers/roulette_state_provider.dart';

class MoneyStatus extends StatefulWidget {
  @override
  _MoneyStatusState createState() => _MoneyStatusState();
}

class _MoneyStatusState extends State<MoneyStatus> {
  @override
  Widget build(BuildContext context) {
    Money _userMoney = Provider.of<Money>(context);
    InvestedMoney _investedMoney = Provider.of<InvestedMoney>(context);
    RouletteState _rouletteState = Provider.of<RouletteState>(context);
    MediaQueryData queryData = MediaQuery.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(top:queryData.size.height * 0.075),
            child: DefaultTextWidget(
              fontWeight: FontWeight.w100,
                fontSize: 18,
                textContent: _investedMoney.investedMoney == null
                    ? 'Your money deposit is empty'
                    : 'You have ${_investedMoney.investedMoney}\$ in deposit and ${_userMoney.quantity} in total')),
        _rouletteState.isFinished == true
            ? ElevatedButton(
                onPressed: () {
                  setState(() {

                  });
                },
                child: const Text("Roger that"),
              )
            : const SizedBox()
      ],
    );
  }
}
