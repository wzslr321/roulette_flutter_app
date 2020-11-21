import 'package:flutter/material.dart';

import '../widgets/games_appbar.dart';

class SpeedGameScreen extends StatelessWidget {
  static const routeName = '/game/speed';
  @override
  Widget build(BuildContext context) {
    return GameAppBar(
      Container(
        child:Text("This is speed game") ,
      ),
    );
  }
}
