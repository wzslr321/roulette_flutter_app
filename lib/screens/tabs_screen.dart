import 'package:flutter/material.dart';

import './menu_screen.dart';
import './profile_screen.dart';
import './roulette_screen.dart';
import 'mini-games/speed_game_screen.dart';
import 'mini-games/reflex_game_screen.dart';

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
    _pages = [
      {
        'page': RouletteScreen(),
      },
      {
        'page': MenuScreen(),
      },
      {
        'page': ProfileScreen(),
      },
      {
        'page': ReflexGameScreen(),
      },
      {
        'page': SpeedGameScreen(),
      },
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Money Maker",
          style: TextStyle(fontWeight: FontWeight.w100, color: Colors.white),
        ),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromRGBO(0, 29, 61, 1),
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: "Roulette",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Menu",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
