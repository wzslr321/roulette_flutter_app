import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import '../widgets/games_appbar.dart';
import '../models/default_text_class.dart';
import '../models/gradient_button_class.dart';
import '../providers/available_money.dart';
import '../widgets/reflex_menu_info.dart';

class ReflexGameScreen extends StatefulWidget {
  static const routeName = '/game/reflex';

  @override
  _ReflexGameScreenState createState() => _ReflexGameScreenState();
}

bool _isAccepted;
int _timeDotRender;
int _timeDotTap;
bool _isLess;

class _ReflexGameScreenState extends State<ReflexGameScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    Money _userMoney = Provider.of<Money>(context);

    double _randomDoubleLeft = new Random().nextInt(9) / 10;
    double _randomDoubleTop = new Random().nextInt(9) / 10;

    final btnGradient = [
      Theme.of(context).primaryColor,
      Color.fromRGBO(0, 29, 61, 0.5),
      Theme.of(context).primaryColor,
    ];

    void onDotTap() => {
          setState(() {
            _timeDotTap = DateTime.now().millisecond;
            (_timeDotTap - _timeDotRender) > 1
                ? _isLess = true
                : _isLess = false;
            _timeDotRender = DateTime.now().millisecond;
          }),
          _isLess == true
              ? _userMoney.addLot(moneyQuality.Bronze)
              : _userMoney.addLot(moneyQuality.Gold)
        };

    void _startGame() {
      setState(() {
        _isAccepted = true;
        _timeDotRender = DateTime.now().millisecond;
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
                            gradient: LinearGradient(
                              colors: btnGradient,
                            ),
                            onPressed: _startGame,
                            child: DefaultTextWidget(
                              fontWeight: FontWeight.w100,
                              textContent: 'Click to start',
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                :  Container(
                      height: constraints.maxHeight * 0.025,
                      margin: EdgeInsets.only(
                        left: queryData.size.width * _randomDoubleLeft,
                        top: queryData.size.height * _randomDoubleTop,
                      ),
                      child: InkWell(
                        onTap:onDotTap,
                        child: CircleAvatar(
                          backgroundColor:Theme.of(context).primaryColor,
                        ),
                      ),
                  ),
          ],
        ),
      ),
    );
  }
}
