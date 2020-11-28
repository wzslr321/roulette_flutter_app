import 'package:flutter/material.dart';

import '../widgets/menu_and_profile_header.dart';
import '../widgets/menu_quotes.dart';
import '../widgets/scrollable_menu.dart';
import '../widgets/menu_game_buttons.dart';

import './speed_game_screen.dart';
import './reflex_game_screen.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: <Widget>[
          HeaderInformation(constraints, queryData, 0.275,
              'Choose what type of game You want to play!'),
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
              itemCount: 2,
              scrollableItems: [
                GameButton(
                  itemText: 'Reflex',
                  routeName: ReflexGameScreen.routeName,
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
