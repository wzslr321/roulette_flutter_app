import 'package:flutter/material.dart';

import '../widgets/games_appbar.dart';
import '../models/default_text_class.dart';
import '../models/gradient_button_class.dart';

class SpeedGameScreen extends StatelessWidget {
  static const routeName = '/game/speed';

  @override
  Widget build(BuildContext context) {
    return GameAppBar(LayoutBuilder(
      builder: (context, constraints) => Card(
        elevation: 15,
        margin: const EdgeInsets.all(10),
        child: Container(
          height: constraints.maxHeight * 0.15,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DefaultTextWidget(
                textContent:
                    'This game is insanely easy. You get 1\$ for every tap!',
                fontWeight: FontWeight.w100,
              ),
              GradientBorderButtonContainer(
                  child: DefaultTextWidget(
                textContent: "Hi",
              ))
            ],
          ),
        ),
      ),
    ));
  }
}
