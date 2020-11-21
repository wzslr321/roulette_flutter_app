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
      Theme.of(context).primaryColor,
      Color.fromRGBO(0, 29, 61, 0.5),
      Theme.of(context).primaryColor,
    ];

    return LayoutBuilder(
      builder: (context, constraints) => Container(
        width: constraints.maxWidth * 1,
        height: constraints.maxHeight * 1,
        child: Column(
          children: <Widget>[
            Container(
              height: constraints.maxHeight * 0.275,
              padding:
                  EdgeInsets.symmetric(horizontal: queryData.size.width * 0.05),
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.only(bottom: queryData.size.height * 0.01),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 3.0))),
                child: DefaultTextWidget(
                  textContent: "Choose what type of game you want to play!",
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  fontSize: 22 * queryData.textScaleFactor,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(
                  width: 3.0,
                  color: Color.fromRGBO(0, 29, 61, 0.7),
                ),
                bottom: BorderSide(
                  width: 3.0,
                  color: Color.fromRGBO(0, 29, 61, 0.7),
                ),
              )),
              width: constraints.maxWidth * 1,
              height: constraints.maxHeight * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GradientBorderButtonContainer(
                    gradient: LinearGradient(
                      colors: btnGradient,
                    ),
                    onPressed: () {
                      print(SpeedGameScreen.routeName);
                      Navigator.of(context)
                          .pushNamed(SpeedGameScreen.routeName);
                    },
                    child: Container(
                        width: queryData.size.width * 0.15,
                        child: DefaultTextWidget(
                            textContent: 'Speed', letterSpacing: 0.75)),
                  ),
                  GradientBorderButtonContainer(
                    gradient: LinearGradient(
                      colors: btnGradient,
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(ReflexGameScreen.routeName);
                    },
                    child: Container(
                        width: queryData.size.width * 0.15,
                        child: DefaultTextWidget(
                          textContent: 'Reflex',
                          letterSpacing: 0.75,
                        )),
                  ),
                ],
              ),
            ),
            Container(
              height: constraints.maxHeight * 0.325,
              width: constraints.maxWidth * 1,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.only(
                        right: queryData.size.width * 0.1,
                        top: queryData.size.height * 0.035),
                    child: DefaultTextWidget(
                      textContent: '"Speed" is sure money, without a risk',
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(
                        left: queryData.size.width * 0.05,
                        top: queryData.size.height * 0.025),
                    child: DefaultTextWidget(
                      textContent:
                          '"Reflex" is like Russian roulette ',
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: queryData.size.height * 0.04),
                    child: DefaultTextWidget(
                      textContent: 'What type of player are you...?',
                      fontWeight: FontWeight.w700,
                      fontSize: 18 * queryData.textScaleFactor,
                      letterSpacing: 0.5,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
