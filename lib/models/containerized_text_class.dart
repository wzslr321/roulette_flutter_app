import 'package:flutter/material.dart';

class DefaultTextWidget extends StatelessWidget{
  @required final String textContent;
  final FontWeight fontWeight;
  final double fontSize;
  final Color fontColor;
  final TextAlign textAlign;
  final bool isFittedBox;
  final bool isContainerized;
  final double width;
  final double height;

  const DefaultTextWidget({
    this.textContent,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.fontColor = Colors.black,
    this.textAlign = TextAlign.center,
    this.isFittedBox = true,
    this.isContainerized = false,
    this.width = double.infinity,
    this.height
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
        )
    );

    return isContainerized ? Container (
      width: width,
      height: height,
      child: isFittedBox ? FittedBox(
            child: textWidget
        ) : textWidget
    ) : isFittedBox ? FittedBox(
        child: textWidget
    ) : textWidget;
  }
}