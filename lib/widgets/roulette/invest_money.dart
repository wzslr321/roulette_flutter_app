import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shopping_helper/models/default_text_class.dart';

import '../../providers/available_money_provider.dart';
import '../../providers/invested_money_provider.dart';

class InvestMoney extends StatefulWidget {
  InvestMoney({Key key}) : super(key: key);

  @override
  _InvestMoneyState createState() => _InvestMoneyState();
}

class _InvestMoneyState extends State<InvestMoney> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    Money _userMoney = Provider.of<Money>(context);
    InvestedMoney _investedMoney = Provider.of<InvestedMoney>(context);
    MediaQueryData _queryData = MediaQuery.of(context);

    int _moneyInvested;

    void _investMoneyValidation() {
      if(_moneyInvested <= _userMoney.quantity){
        _userMoney.removeMoney(_moneyInvested);
        _investedMoney.investMoney(_moneyInvested);
      }
    }

    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width:_queryData.size.width * 0.65,
            child: TextFormField(
              textAlign: TextAlign.center,
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
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _investMoneyValidation();
              }
            },
            child: const DefaultTextWidget(textContent:"Submit",fontColor: Colors.white70,),
          )
        ],
      ),
    );
  }
}
