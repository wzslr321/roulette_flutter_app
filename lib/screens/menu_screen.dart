import 'package:flutter/material.dart';

import '../widgets/menu_game_buttons.dart';
import '../models/default_text_class.dart';
import '../widgets/menu_quotes.dart';
import './reflex_game_screen.dart';
import './speed_game_screen.dart';
import '../models/page_view_physics.dart';

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
            height: constraints.maxHeight * 0.4,
            child: ListView.builder(
              clipBehavior: Clip.antiAlias,
              scrollDirection: Axis.horizontal,
              physics: CustomScrollPhysics(itemDimension: 100),
              itemCount: 3,
              itemBuilder: (context, index) => index == 0
                  ? Container(
                      padding: EdgeInsets.only(
                          top: queryData.size.height * 0.1,
                          bottom: queryData.size.height * 0.1,
                          left: queryData.size.width * 0.35,),
                      child: GameButton('Speed', ReflexGameScreen.routeName),
                    ) : index == 1 ?
                  Container(
                      padding: EdgeInsets.only(
                          top: queryData.size.height * 0.1,
                          bottom: queryData.size.height * 0.1,
                          left: queryData.size.width * 0.25,
                          right: queryData.size.width * 0.15),
                      child: GameButton('Reflex', ReflexGameScreen.routeName),
                    ) :  Container(
                padding: EdgeInsets.only(
                    top: queryData.size.height * 0.1,
                    bottom: queryData.size.height * 0.1,
                    left: queryData.size.width * 0.125,
                    right: queryData.size.width * 0.325),
                child: GameButton('Reflex', ReflexGameScreen.routeName),),
            ),
          ),
          QuotesContainer(constraints),
        ],
      ),
    );
  }
}
