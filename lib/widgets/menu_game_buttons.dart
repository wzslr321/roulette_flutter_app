import 'package:flutter/material.dart';

import '../models/gradient_button_class.dart';
import '../models/default_text_class.dart';

class GameButton extends StatelessWidget {
  final String itemText;
  final String routeName;

  GameButton({this.itemText, this.routeName});

  @override
  Widget build(BuildContext context) {
    final btnGradient = [
      Theme.of(context).primaryColor,
      Color.fromRGBO(0, 29, 61, 0.5),
      Theme.of(context).primaryColor,
    ];

    final MediaQueryData queryData = MediaQuery.of(context);

    return GradientBorderButtonContainer(
        gradient: LinearGradient(
          colors: btnGradient,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(routeName);
        },
        child: Container(
          width:  queryData.size.width * 0.5,
          child: DefaultTextWidget(textContent: itemText, fontSize: 14, fontWeight: FontWeight.w100,),
        ),
    );
  }
}
