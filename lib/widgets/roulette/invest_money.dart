import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../providers/money_providers/available_money_provider.dart';
import '../../providers/money_providers/invested_money_provider.dart';

class InvestMoney extends StatefulWidget {
  InvestMoney({Key key}) : super(key: key);

  @override
  _InvestMoneyState createState() => _InvestMoneyState();
}

String _moneyValidationFailString;

class _InvestMoneyState extends State<InvestMoney> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Money _userMoney = Provider.of<Money>(context);
    InvestedMoney _investedMoney = Provider.of<InvestedMoney>(context);

    MediaQueryData queryData = MediaQuery.of(context);

    int _moneyInvested;

    void _moneyValidation() {
      if (_userMoney.quantity < _moneyInvested) {
        setState(() {
          _moneyValidationFailString = "You do not have enough money to bet!";
        });
      } else {
        setState(() {
          _moneyValidationFailString = null;
        });
        _userMoney.removeMoney(_moneyInvested);
        _investedMoney.investMoney(_moneyInvested);
      }
    }

    return Column(
      children: [
        _investedMoney.investedMoney == 0
            ? Form(
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
                        _moneyInvested = int.parse(value);
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _moneyValidation();
                        }
                      },
                      child: const Text("Submit"),
                    )
                  ],
                ),
              )
            : SizedBox(),
        _moneyValidationFailString != null ? Container(
          height: queryData.size.height * 0.1,
          width: double.infinity,
          color: Colors.green,
          child: Text(
            _moneyValidationFailString ,
          ),
        ) : SizedBox(),
      ],
    );
  }
}
