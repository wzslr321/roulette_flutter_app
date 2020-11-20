import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/available_lots.dart';
import './playground_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreen createState() => _TabsScreen();
}

class _TabsScreen extends State<TabsScreen> {

  // final List<Widget> _routes = [
  //   PlaygroundScreen(),
  // ];
  // int _selectedPageIndex = 0;
  // void _selectPage(int index) {
  //   setState((){
  //     _selectedPageIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final _lots = Provider.of<Lots>(context);

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Money Maker",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: queryData.size.width * 0.05),
            child: Text(
              'Lots: ${_lots.lotsQuantity}',
              style: TextStyle(
                  fontSize: 16 * queryData.textScaleFactor,
                  fontWeight: FontWeight.w100),
            ),
          ),
        ],
      ),
      body: PlaygroundScreen(),
      bottomNavigationBar: BottomNavigationBar(
        onTap:null,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.fifteen_mp),
            label:"Lorem",
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.fifteen_mp),
            label:"Ipsum",
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.fifteen_mp),
            label:"Dolor",
          ),
        ],
      ),
    );
  }
}
