import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/default_text_model.dart';
import '../../providers/money_providers/available_money_provider.dart';
import '../../providers/money_providers/invested_money_provider.dart';

class MoneyStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Money _userMoney = Provider.of<Money>(context);
    InvestedMoney _investedMoney = Provider.of<InvestedMoney>(context);

    return Column(
      children: <Widget>[
        Container(
            child: DefaultTextWidget(
                textContent: _investedMoney.investedMoney == null
                    ? 'Your money deposit is empty'
                    : 'You have ${_investedMoney.investedMoney}\$ in deposit and ${_userMoney.quantity} in total!')),
      ],
    );
  }
}
