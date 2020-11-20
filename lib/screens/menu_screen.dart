import 'package:flutter/material.dart';

import '../models/containerized_text_class.dart';
import '../models/gradient_button_class.dart';

import './speed_game_screen.dart';
import './reflex_game_screen.dart';


class MenuScreen extends StatelessWidget {
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    final btnGradient = [
      Colors.black,
      Colors.red,
      Colors.blue,
    ];

    return LayoutBuilder(
      builder: (context, constraints) => Container(
        color: Colors.green,
        width: constraints.maxWidth * 1,
        height: constraints.maxHeight * 1,
        child: Column(
          children: <Widget>[
            Container(
              height: constraints.maxHeight * 0.275,
              padding:
                  EdgeInsets.symmetric(horizontal: queryData.size.width * 0.05),
              child: FittedBox(
                child: Text("Choose what type of game you want to play!"),
              ),
            ),
            Container(
              color: Colors.purple,
              width: constraints.maxWidth * 1,
              height: constraints.maxHeight * 0.4,
              child: Row(
                children: [
                  GradientBorderButtonContainer(
                    gradient: LinearGradient(
                      colors: btnGradient,
                    ),
                    onPressed: () {
                      print(SpeedGameScreen.routeName);
                      Navigator.of(context).pushNamed(SpeedGameScreen.routeName);
                    },
                    child: DefaultTextWidget(textContent: 'Speed'),
                  ),
                  GradientBorderButtonContainer(
                    gradient: LinearGradient(
                      colors: btnGradient,
                    ),
                    onPressed:() {
                      Navigator.of(context).pushNamed(ReflexGameScreen.routeName);
                    },
                    child: DefaultTextWidget(textContent: 'Reflex'),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.blue,
              height: constraints.maxHeight * 0.325,
              width: constraints.maxWidth * 1,
              child: Column(
                children: <Widget>[
                  DefaultTextWidget(
                    textContent: '"Speed" is sure money, without a risk',
                  ),
                  DefaultTextWidget(
                    textContent:
                        '"Reflex" may make you a millionaire or bankrupt! ',
                  ),
                  DefaultTextWidget(
                      textContent: 'What type of player are you...?')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
