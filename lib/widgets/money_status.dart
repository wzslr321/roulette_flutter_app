import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/default_text_class.dart';
import '../providers/available_money_provider.dart';
import '../providers/invested_money_provider.dart';

class MoneyStatus extends StatefulWidget {
  @override
  _MoneyStatusState createState() => _MoneyStatusState();
}

class _MoneyStatusState extends State<MoneyStatus> {
  @override
  Widget build(BuildContext context) {
    Money userMoney = Provider.of<Money>(context);

    return Column(
      children: <Widget>[
        Container(child: Consumer<InvestedMoney>(builder: (_, money, __) {
          return DefaultTextWidget(
              textContent: money == null
                  ? 'Your money deposit is empty'
                  : 'You have ${money.investedMoney}\$ in deposit');
        })),
        Container(
            child: DefaultTextWidget(
          textContent: 'You have ${userMoney.quantity}\$ total',
        ))
      ],
    );
  }
}
