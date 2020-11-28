import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/available_money_provider.dart';
import '../providers/invested_money_provider.dart';

class InvestMoney extends StatefulWidget {
  InvestMoney({Key key}) : super(key: key);

  @override
  _InvestMoneyState createState() => _InvestMoneyState();
}

int _moneyInvested;

class _InvestMoneyState extends State<InvestMoney> {

  void investMoney(val, Money userMoney) {
    setState(() {
      userMoney.removeMoney(_moneyInvested);
      InvestedMoney().investMoney(_moneyInvested);
    });
  }


  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    Money userMoney = Provider.of<Money>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration:
                const InputDecoration(hintText: 'How much do you want to bet?'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter money amount first';
              }
              _moneyInvested = int.parse(value);
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                investMoney(_moneyInvested, userMoney);
              }
            },
            child: Text("Submit"),
          )
        ],
      ),
    );
  }
}
