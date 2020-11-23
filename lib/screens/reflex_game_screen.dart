import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

import '../widgets/games_appbar.dart';
import '../models/default_text_class.dart';
import '../models/gradient_button_class.dart';

class ReflexGameScreen extends StatefulWidget {
  static const routeName = '/game/reflex';

  @override
  _ReflexGameScreenState createState() => _ReflexGameScreenState();
}

bool isAccepted;
int timeDotRender;
int timeDotTap;
int userMoney = 0;

class _ReflexGameScreenState extends State<ReflexGameScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    double _randomDoubleLeft = new Random().nextInt(9) / 10;
    double _randomDoubleTop = new Random().nextInt(9) / 10;

    final btnGradient = [
      Theme.of(context).primaryColor,
      Color.fromRGBO(0, 29, 61, 0.5),
      Theme.of(context).primaryColor,
    ];

    void onDotTap() => {
          setState(() {
            timeDotTap = int.parse(DateFormat.s().format(DateTime.now()));
            timeDotTap - timeDotRender > 1 ? userMoney -= 15 : userMoney += 5;
            timeDotRender = int.parse(DateFormat.s().format(DateTime.now()));
          })
        };

    void _startGame() {
      setState(() {
        isAccepted = true;
        timeDotRender = int.parse(DateFormat.s().format(DateTime.now()));
      });
    }

    print(isAccepted);
    print(timeDotRender);
    print(userMoney);

    return GameAppBar(
      LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            isAccepted != true
                ? Container(
                    width: double.infinity,
                    height: constraints.maxHeight * 1,
                    child: Column(
                      children: [
                        Card(
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: queryData.size.width * 0.05,
                                    top: queryData.size.height * 0.05,
                                    bottom: queryData.size.height * 0.05),
                                child: DefaultTextWidget(
                                  textContent: 'Accurate tap = +5\$  ',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w100,
                                  isFittedBox: false,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    right: queryData.size.width * 0.05),
                                child: DefaultTextWidget(
                                  textContent: 'Miss = -20\$',
                                  fontWeight: FontWeight.w100,
                                  fontSize: 20,
                                  isFittedBox: false,
                                ),
                              ),
                            ],
                          ),
                        ),
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
                              )),
                        )
                      ],
                    ),
                  )
                : InkWell(
                    onTap: onDotTap,
                    child: Container(
                      height: constraints.maxHeight * 0.025,
                      margin: EdgeInsets.only(
                        left: queryData.size.width * _randomDoubleLeft,
                        top: queryData.size.height * _randomDoubleTop,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 50.0,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
