import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import '../../widgets/mini_games/games_appbar.dart';
import '../../models/default_text_class.dart';
import '../../models/gradient_button_class.dart';
import '../../providers/available_money_provider.dart';
import '../../widgets/mini_games/reflex_menu_info.dart';

class ReflexGameScreen extends StatefulWidget {
  static const routeName = '/game/reflex';

  @override
  _ReflexGameScreenState createState() => _ReflexGameScreenState();
}

// This file is awful, and I am aware of it.
// It is  made chaotic, just to give a possibility to earn money.
// Mini-games most probably are  going to be totally rebuild.

bool _isAccepted;
int _timeDotRenderMs;
int _timeDotRenderS;
int _timeDotTapMs;
int _timeDotTapS;
bool _isLess;

class _ReflexGameScreenState extends State<ReflexGameScreen> {
  @override
  Widget build(BuildContext context) {
    double _randomDoubleLeft = new Random().nextInt(9) / 10;
    double _randomDoubleTop = new Random().nextInt(9) / 10;

    MediaQueryData queryData = MediaQuery.of(context);

    Money _userMoney = Provider.of<Money>(context);

    void onDotTap() => {
          setState(() {
            _timeDotTapMs = DateTime.now().millisecond;
            _timeDotTapS = DateTime.now().second;
            ((_timeDotTapMs - _timeDotRenderMs) < 1 &&
                        (_timeDotTapS - _timeDotRenderS) == 0) ||
                    (_timeDotTapS - _timeDotRenderS) < 2
                ? _isLess = false
                : _isLess = true;
            _timeDotRenderMs = DateTime.now().millisecond;
            _timeDotRenderS = DateTime.now().second;
            _isLess == true
                ? _userMoney.addGameMoney(moneyQuality.Bronze)
                : _userMoney.addGameMoney(moneyQuality.Gold);
          }),
        };

    void _startGame() {
      setState(() {
        _isAccepted = true;
        _timeDotRenderMs = DateTime.now().millisecond;
        _timeDotRenderS = DateTime.now().second;
      });
    }

    return GameAppBar(
      LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            _isAccepted != true
                ? Container(
                    width: double.infinity,
                    height: constraints.maxHeight * 1,
                    child: Column(
                      children: [
                        ReflexMenuInformation(
                            'Accurate = +5\$', 'Miss = -15\$'),
                        Container(
                          margin:
                              EdgeInsets.only(top: constraints.maxHeight * 0.3),
                          height: constraints.maxHeight * 0.15,
                          child: GradientBorderButtonContainer(
                            onPressed: _startGame,
                            child: const DefaultTextWidget(
                              fontWeight: FontWeight.w100,
                              textContent: 'Click to start',
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    height: constraints.maxHeight * 0.025,
                    margin: EdgeInsets.only(
                      left: queryData.size.width * _randomDoubleLeft,
                      top: queryData.size.height * _randomDoubleTop,
                    ),
                    child: InkWell(
                      onTap: onDotTap,
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
