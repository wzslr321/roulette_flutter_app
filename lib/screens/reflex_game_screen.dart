import 'package:flutter/material.dart';
import 'dart:math';

import '../widgets/games_appbar.dart';
import '../models/default_text_class.dart';
import '../models/gradient_button_class.dart';

class ReflexGameScreen extends StatefulWidget {
  static const routeName = '/game/reflex';

  @override
  _ReflexGameScreenState createState() => _ReflexGameScreenState();
}

class _ReflexGameScreenState extends State<ReflexGameScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    double _randomDoubleLeft = new Random().nextInt(9) / 10;
    double _randomDoubleTop = new Random().nextInt(9) / 10;

    var isAccepted = false;

    final btnGradient = [
      Theme.of(context).primaryColor,
      Color.fromRGBO(0, 29, 61, 0.5),
      Theme.of(context).primaryColor,
    ];

    return GameAppBar(
      LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            isAccepted == false
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
                                    left: queryData.size.width * 0.05,top:queryData.size.height * 0.05, bottom: queryData.size.height * 0.05),
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
                          margin: EdgeInsets.only(top:constraints.maxHeight * 0.3),
                          height: constraints.maxHeight * 0.15,
                          child: GradientBorderButtonContainer(
                              gradient: LinearGradient(
                                colors: btnGradient,
                              ),
                              child: DefaultTextWidget(
                                textContent: 'Click to start',
                              )),
                        )
                      ],
                    ),
                  )
                : Container(
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
          ],
        ),
      ),
    );
  }
}
