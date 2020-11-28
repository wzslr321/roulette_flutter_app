import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/default_text_class.dart';
import '../providers/available_money.dart';
import '../functions/invest_money.dart';

class MoneyStatus extends StatefulWidget {
  @override
  _MoneyStatusState createState() => _MoneyStatusState();
}

class _MoneyStatusState extends State<MoneyStatus> {
  @override
  Widget build(BuildContext context) {

    Money userMoney = Provider.of<Money>(context);

    int _moneyInvested = InvestMoney.investedMoney;

    print(_moneyInvested);

    return Column(
      children:<Widget> [
        Container(
          child: DefaultTextWidget(
              textContent: _moneyInvested == null
                  ? 'Your money deposit is empty'
                  : 'You have $_moneyInvested\$ in deposit'),
        ),
        Container(
            child: DefaultTextWidget(
              textContent: 'You have ${userMoney.quantity}\$ total',
            ))
      ],
    );
  }
}
