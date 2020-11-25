import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/games_appbar.dart';
import '../models/default_text_class.dart';
import '../models/gradient_button_class.dart';
import '../providers/available_money.dart';

class SpeedGameScreen extends StatelessWidget {
  static const routeName = '/game/speed';

 

  @override
  Widget build(BuildContext context) {
    Money userMoney = Provider.of<Money>(context);
    
    void _incrementMoney() {
      userMoney.addLot(moneyQuality.Grey);
    }
    
    return GameAppBar(LayoutBuilder(
      builder: (context, constraints) => Column(
        children: <Widget>[
          Card(
            elevation: 15,
            margin: const EdgeInsets.all(10),
            child: Container(
              alignment: Alignment.center,
              height: constraints.maxHeight * 0.15,
              child: DefaultTextWidget(
                textContent:
                    'This game is insanely easy. You get 1\$ for every tap!',
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: constraints.maxHeight * 0.25),
            child: GradientBorderButtonContainer(
              onPressed:_incrementMoney,
                child: DefaultTextWidget(
              textContent: "Tap me!",
              fontWeight: FontWeight.w100,
              fontSize: 40,
            )),
          )
        ],
      ),
    ));
  }
}
