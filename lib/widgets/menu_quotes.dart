import 'package:flutter/material.dart';

import '../models/default_text_class.dart';

class QuotesContainer extends StatelessWidget {
  final BoxConstraints constraints;

  QuotesContainer(
    this.constraints,
  );

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    return Container(
      height: constraints.maxHeight * 0.325,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.only(
              right: queryData.size.width * 0.05,
              top: queryData.size.height * 0.035,
            ),
            child: const DefaultTextWidget(
              textContent: '"Speed" is sure money, without a risk',
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
                left: queryData.size.width * 0.05,
                top: queryData.size.height * 0.035),
            child: const DefaultTextWidget(
              textContent: '"Reflex" is like Russian roulette ',
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: queryData.size.height * 0.035),
            child: DefaultTextWidget(
              textContent: 'What type of player are you...?',
              fontWeight: FontWeight.w700,
              fontSize: 18 * queryData.textScaleFactor,
              letterSpacing: 0.5,
            ),
          )
        ],
      ),
    );
  }
}
