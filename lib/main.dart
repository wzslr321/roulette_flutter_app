import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/available_lots.dart';

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
          create: (_) => Lots(),
        )
      ],
      child: MaterialApp(
        title: "Money Maker",
        theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            accentColor: Colors.greenAccent,
            fontFamily: 'Roboto'),
        home: TabsScreen(MenuScreen()),
        routes: {
          ProfileScreen.routeName: (ctx) => TabsScreen(ProfileScreen()),
          RouletteScreen.routeName: (ctx) => TabsScreen(RouletteScreen()),
          SpeedGameScreen.routeName: (ctx) => TabsScreen(SpeedGameScreen()),
          ReflexGameScreen.routeName: (ctx) => TabsScreen(ReflexGameScreen())
        },
        onUnknownRoute:(settings) {
          return MaterialPageRoute(builder:(ctx) => PageNotFound());
        }
      ),
    );
  }
}
