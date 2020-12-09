import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/money_providers/available_money_provider.dart';
import '../../models/default_text_model.dart';

class GameAppBar extends StatelessWidget {
  final Widget body;

  GameAppBar(this.body);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Money Maker",
        ),
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: queryData.size.width * 0.05),
            child: Consumer<Money>(
              builder: (_, money, __) {
                return DefaultTextWidget(
                  textContent: 'Money: ${money.quantity}',
                  fontWeight: FontWeight.w100,
                );
              },
            ),
          ),
        ],
      ),
      body: body,
    );
  }
}
