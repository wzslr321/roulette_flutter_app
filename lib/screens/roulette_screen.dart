import 'package:flutter/material.dart';

import '../functions/roulette_animations.dart';
import '../functions/user_bet.dart';
import '../functions/invest_money.dart';
import '../functions/roulette_result_check.dart';
import '../functions/money_status.dart';

class RouletteScreen extends StatefulWidget {

  static const routeName = '/roulette';

  @override
  _RouletteScreenState createState() => _RouletteScreenState();
}

class _RouletteScreenState extends State<RouletteScreen>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData = MediaQuery.of(context);

    return Container(
      width: queryData.size.width,
      height: queryData.size.height,
      child: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            RouletteAnimation(),
            UserBet(),
            InvestMoney(),
            RouletteResult(),
            MoneyStatus(),
          ],
        ),
      )),
    );
  }
}
