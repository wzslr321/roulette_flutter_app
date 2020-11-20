import 'package:flutter/material.dart';

import './menu_screen.dart';
import './profile_screen.dart';
import './roulette_screen.dart';
import './speed_game_screen.dart';
import './reflex_game_screen.dart';

class TabsScreen extends StatefulWidget {

  final Widget displayedScreen;

  TabsScreen(this.displayedScreen);

  @override
  _TabsScreen createState() => _TabsScreen();
}

class _TabsScreen extends State<TabsScreen> {
  List<Map<String, dynamic>> _pages;

  @override
  void initState() {
    _pages =  [
      { 'page': RouletteScreen(),},
      { 'page': MenuScreen(),},
      { 'page': ProfileScreen(),},
      { 'page': ReflexGameScreen(),},
      { 'page': SpeedGameScreen(),},
    ];
    super.initState();
  }

  int _selectedPageIndex = 1;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Money Maker",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.green,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fifteen_mp),
            label: "Roulette",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fifteen_mp),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fifteen_mp),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
