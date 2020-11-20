import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/available_money.dart';

class SpeedGameScreen extends StatelessWidget {
  static const routeName = '/game/speed';
  @override
  Widget build(BuildContext context) {

    final _lots = Provider.of<Money>(context);

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Money Maker",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          actions: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: queryData.size.width * 0.05),
              child: Text(
                'Money: ${_lots.lotsQuantity}',
                style: TextStyle(
                    fontSize: 16 * queryData.textScaleFactor,
                    fontWeight: FontWeight.w100),
              ),
            ),
          ],
        ),
        body:Container(),
    );
  }
}
