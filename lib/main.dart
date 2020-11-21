import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/available_money.dart';

import './screens/tabs_screen.dart';
import './screens/menu_screen.dart';
import './screens/profile_screen.dart';
import './screens/roulette_screen.dart';
import './screens/speed_game_screen.dart';
import './screens/reflex_game_screen.dart';
import './screens/page_not_found_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Money(),
        )
      ],
      child: MaterialApp(
          title: "Money Maker",
          theme: ThemeData(
            primarySwatch:Colors.cyan,
            accentColor: Colors.cyanAccent,
            fontFamily: 'Roboto',
          ),
          home: TabsScreen(MenuScreen()),
          routes: {
            ProfileScreen.routeName: (ctx) => TabsScreen(ProfileScreen()),
            RouletteScreen.routeName: (ctx) => TabsScreen(RouletteScreen()),
            SpeedGameScreen.routeName: (ctx) => SpeedGameScreen(),
            ReflexGameScreen.routeName: (ctx) => ReflexGameScreen()
          },
          onUnknownRoute: (settings) {
            return MaterialPageRoute(builder: (ctx) => PageNotFound());
          }),
    );
  }
}
