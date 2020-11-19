import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/playground_screen.dart';
import './providers/available_lots.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Lots(),)
      ],
      child: MaterialApp(
        title:"Money Maker",
        theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            accentColor: Colors.greenAccent
        ),
        home:PlaygroundScreen(),
      ),
    );
  }
}
