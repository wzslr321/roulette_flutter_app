import 'package:flutter/material.dart';

import '../models/default_text_class.dart';

class RouletteItem extends StatelessWidget {
  final String text;
  final Color bgColor;
  final BorderRadius borderRadius;

  RouletteItem(this.text, this.bgColor, this.borderRadius);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return Expanded(
      child: Container(
        height: queryData.size.height * 0.3,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
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
