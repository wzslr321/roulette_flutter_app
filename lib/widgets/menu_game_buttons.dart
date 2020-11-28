import 'package:flutter/material.dart';

import '../models/gradient_button_class.dart';
import '../models/default_text_class.dart';

class GameButton extends StatelessWidget {
  final String itemText;
  final String routeName;

  GameButton({this.itemText, this.routeName});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    return GradientBorderButtonContainer(
      onPressed: () {
        Navigator.of(context).pushNamed(routeName);
      },
      child: Container(
        width: queryData.size.width * 0.5,
        child: DefaultTextWidget(
          textContent: itemText,
          fontSize: 14,
          fontWeight: FontWeight.w100,
        ),
      ),
    );
  }
}
