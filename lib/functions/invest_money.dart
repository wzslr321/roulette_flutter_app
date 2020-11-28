import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/available_money.dart';

class InvestMoney extends StatefulWidget {
  InvestMoney({Key key}) : super(key: key);

  static final investedMoney = moneyInvested;

  @override
  _InvestMoneyState createState() => _InvestMoneyState();
}

int moneyInvested;


class _InvestMoneyState extends State<InvestMoney> {

  void investMoney(val, Money userMoney) {
    setState(() {
      userMoney.removeMoney(moneyInvested);
    });
  }

  @override
  Widget build(BuildContext context) {

    print(moneyInvested);

    final _formKey = GlobalKey<FormState>();
    Money userMoney = Provider.of<Money>(context);

    return  Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                  hintText: 'How much do you want to bet?'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter money amount first';
                }
                moneyInvested = int.parse(value);
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  investMoney(moneyInvested, userMoney);
                }
              },
              child: Text("Submit"),
            )
          ],
        ),
    );
  }
}
