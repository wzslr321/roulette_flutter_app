import 'package:flutter/material.dart';

import '../widgets/menu_and_profile_header.dart';
import '../widgets/menu/menu_quotes.dart';
import '../models/scrollable_menu_model.dart';
import '../widgets/menu/menu_game_buttons.dart';

import 'mini-games/speed_game_screen.dart';
import 'mini-games/reflex_game_screen.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    const BorderSide _containerBorder = const BorderSide(
      width: 3.0,
      color: Color.fromRGBO(0, 29, 61, 0.7),
    );

    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: <Widget>[
          HeaderInformation(constraints, queryData, 0.275,
              'Choose what type of game You want to play!'),
          Container(
            height: constraints.maxHeight * 0.4,
            decoration: BoxDecoration(
                border: Border(
              top: _containerBorder,
              bottom: _containerBorder,
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
