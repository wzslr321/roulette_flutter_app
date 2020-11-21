import 'package:flutter/material.dart';

import '../widgets/games_appbar.dart';

class ReflexGameScreen extends StatelessWidget {
  static const routeName = '/game/reflex';
  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return GameAppBar(
      Container(
        child:Text("This is speed game") ,
      ),
    );
  }
}
