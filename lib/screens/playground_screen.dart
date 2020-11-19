import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/available_lots.dart';

class PlaygroundScreen extends StatelessWidget {
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    final _lots = Provider.of<Lots>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Money Maker"),
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: queryData.size.width * 0.05),
            child: Text(
              'Lots: ${_lots.lotsQuantity}',
              style:
              TextStyle(fontSize: 16 * queryData.textScaleFactor),
            ),),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) =>
            Container(
              child: InkWell(
                  onTap:() => _lots.addLot(lotQuality.Diamond),
                  child:Text("Elegant Button")
              ),
            ),
      ),
    );
  }
}
