import 'package:flutter/material.dart';
import '../../models/default_text_model.dart';

class ReflexMenuInformation extends StatelessWidget {
  final String textContentLeft;
  final String textContentRight;

  ReflexMenuInformation(this.textContentLeft, this.textContentRight);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return Card(
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: queryData.size.width * 0.05,
            vertical: queryData.size.height * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultTextWidget(
              textContent: textContentLeft,
              fontSize: 20,
              fontWeight: FontWeight.w100,
              isFittedBox: false,
            ),
            DefaultTextWidget(
              textContent: textContentRight,
              fontWeight: FontWeight.w100,
              fontSize: 20,
              isFittedBox: false,
            ),
          ],
        ),
      ),
    );
  }
}
