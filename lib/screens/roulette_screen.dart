import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../functions/roulette_animations.dart';

import '../models/default_text_class.dart';
import '../providers/available_money.dart';

class RouletteScreen extends StatefulWidget {

  static const routeName = '/roulette';

  @override
  _RouletteScreenState createState() => _RouletteScreenState();
}

enum possibleBets {
  Black,
  Red,
}

class _RouletteScreenState extends State<RouletteScreen>
    with TickerProviderStateMixin {
  bool didWin;
  bool didEnd;
  bool didStart = false;
  bool isRedOnTween;
  possibleBets userBet;
  String moneyInvested;

  void betRed() {
    setState(() {
      userBet = possibleBets.Red;
    });
  }

  void betBlack() {
    setState(() {
      userBet = possibleBets.Black;
    });
  }

  void investMoney(val, Money userMoney) {
    setState(() {
      moneyInvested = val;
      int convMoney = int.parse(val);
      userMoney.removeMoney(convMoney);
    });
  }

  double tweenEnd = 0;

  @override
  Widget build(BuildContext context) {
    Money userMoney = Provider.of<Money>(context);

    MediaQueryData queryData = MediaQuery.of(context);

    return Container(
      width: queryData.size.width,
      height: queryData.size.height,
      child: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            RouletteAnimation(),
            Container(
              child: DefaultTextWidget(
                  textContent: moneyInvested == null
                      ? 'Your money deposit is empty'
                      : 'You have $moneyInvested\$ in deposit'),
            ),
            Container(
                child: DefaultTextWidget(
              textContent: 'You have ${userMoney.quantity}\$ total',
            )),
          ],
        ),
      )),
    );
  }
}
