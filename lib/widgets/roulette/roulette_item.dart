import 'package:flutter/material.dart';

import '../../models/default_text_class.dart';

class RouletteItem extends StatelessWidget {
  final String text;
  final Color bgColor;

  RouletteItem(this.text, this.bgColor);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return Expanded(
      flex: 5,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
        ),
        child: Center(
          child: DefaultTextWidget(
            textContent: text,
            fontColor: Colors.white,
            isFittedBox: false,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
