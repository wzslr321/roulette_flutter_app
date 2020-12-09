import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/menu_and_profile_header.dart';
import '../providers/money_providers/available_money_provider.dart';
import '../models/default_text_model.dart';
import '../providers/profile_providers/profile_level_provider.dart';
import '../models/gradient_button_model.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    Money userMoney = Provider.of<Money>(context);
    ProfileLevel userLevel = Provider.of<ProfileLevel>(context);

    final int _moneyNeeded = userLevel.moneyNeeded - userMoney.quantity;

    final bool _isAbleToLvlUp = _moneyNeeded <= 0 ? true : false;

    final String _moneyNeededText =
        userLevel.moneyNeeded - userMoney.quantity >= 0
            ? 'You need $_moneyNeeded money to level up!'
            : 'You can level up your profile now!';

    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: <Widget>[
          HeaderInformation(constraints, queryData, 0.25,
              'You can upgrade your profile with money!'),
          Card(
            elevation: 15,
            margin: const EdgeInsets.all(15),
            child: Container(
              height: constraints.maxHeight * 0.15,
              padding:
                  EdgeInsets.symmetric(horizontal: queryData.size.width * 0.05),
              alignment: Alignment.center,
              child: Consumer<Money>(
                builder: (_, money, __) {
                  return DefaultTextWidget(
                    textContent: _moneyNeededText,
                    isFittedBox: false,
                    fontWeight: FontWeight.w100,
                  );
                },
              ),
            ),
          ),
          _isAbleToLvlUp
              ? GradientBorderButtonContainer(
                  onPressed: () {
                    userLevel.levelUp();
                    userMoney.removeMoney(userLevel.moneyForLvl);
                  },
                  child: const DefaultTextWidget(
                    textContent: 'Level Up!',
                  ),
                )
              : GradientBorderButtonContainer(
                  child: const DefaultTextWidget(
                    textContent: 'Earn money first!',
                  ),
                ),
          HeaderInformation(constraints, queryData, 0.25,
              'You have ${userLevel.level} level '),
        ],
      ),
    );
  }
}
