import 'package:flutter/material.dart';

import '../models/default_text_class.dart';
import '../widgets/menu_quotes.dart';
import '../widgets/scrollable_menu.dart';
import '../widgets/menu_game_buttons.dart';

import './speed_game_screen.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: <Widget>[
          Container(
            height: constraints.maxHeight * 0.275,
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: queryData.size.height * 0.01,
                  horizontal: queryData.size.width * 0.025),
              margin:
                  EdgeInsets.symmetric(horizontal: queryData.size.width * 0.05),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Color.fromRGBO(0, 29, 61, 0.7), width: 1.5),
                ),
              ),
              child: DefaultTextWidget(
                textContent: "Choose what type of game you want to play!",
                fontWeight: FontWeight.bold,
                fontSize: 22 * queryData.textScaleFactor,
              ),
            ),
          ),
          Container(
            height: constraints.maxHeight * 0.4,
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
            child: ScrollableMenu(
              scrollableItems: [
                GameButton(
                  itemText: 'Speed',
                  routeName: SpeedGameScreen.routeName,
                ),
                GameButton(
                  itemText: 'Speed',
                  routeName: SpeedGameScreen.routeName,
                ),
                GameButton(
                  itemText: 'Speed',
                  routeName: SpeedGameScreen.routeName,
                ),
              ],
              itemWidth: queryData.size.width * 0.5,
            ),
          ),
          QuotesContainer(constraints),
        ],
      ),
    );
  }
}
