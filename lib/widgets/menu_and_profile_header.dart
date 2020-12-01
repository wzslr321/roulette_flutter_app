import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/default_text_class.dart';

class HeaderInformation extends StatelessWidget {
  final BoxConstraints constraints;
  final MediaQueryData queryData;
  final String textContent;
  final double containerHeight;

  HeaderInformation(
      this.constraints, this.queryData, this.containerHeight, this.textContent);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.maxHeight * containerHeight,
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: queryData.size.height * 0.01,
            horizontal: queryData.size.width * 0.025),
        margin: EdgeInsets.symmetric(horizontal: queryData.size.width * 0.05),
        decoration: const BoxDecoration(
          border: Border(
            bottom:
                BorderSide(color: Color.fromRGBO(0, 29, 61, 0.7), width: 1.5),
          ),
        ),
        child: DefaultTextWidget(
          textContent: textContent,
          fontWeight: FontWeight.bold,
          fontSize: 22 * queryData.textScaleFactor,
        ),
      ),
    );
  }
}
