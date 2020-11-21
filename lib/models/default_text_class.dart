import 'package:flutter/material.dart';

class DefaultTextWidget extends StatelessWidget{
  @required final String textContent;
  final FontWeight fontWeight;
  final double fontSize;
  final Color fontColor;
  final TextAlign textAlign;
  final bool isFittedBox;
  final double letterSpacing;

  const DefaultTextWidget({
    this.textContent,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.fontColor = Colors.black,
    this.textAlign = TextAlign.center,
    this.isFittedBox = true,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;

    final textWidget = Text(
        textContent,
        textAlign:textAlign,
        style:TextStyle(
            fontSize: fontSize * curScaleFactor,
            fontWeight: fontWeight,
            color:fontColor,
            letterSpacing: letterSpacing,
        )
    );

    return  isFittedBox ? FittedBox(
            child: textWidget
        ) : textWidget;
  }
}