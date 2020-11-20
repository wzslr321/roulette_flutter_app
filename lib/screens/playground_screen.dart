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
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          color: Colors.green,
          width: constraints.maxWidth * 1,
          height: constraints.maxHeight * 1,
          child: Column(
            children:<Widget> [
              Container(
                height: constraints.maxHeight * 0.25,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: FittedBox(
                  child: Text("Choose what type of game you want to play!"),
                ),
              ),
              Container(
                color: Colors.blue,
                height: constraints.maxHeight * 0.25,
                width: constraints.maxWidth * 1,
                child: Column(
                  children:<Widget> [
                    Container(
                      child: FittedBox(
                        child: Text(
                          'Speed is sure money, without risk'
                        ),
                      ),
                    ),
                    Container(
                      child: FittedBox(
                        child: Text(
                          '"Reflex" may make you a millionaire or bankrupt! '
                        ),
                      ),
                    ),
                    Container(
                      child: FittedBox(
                        child: Text(
                            'What type of player are you...?'
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color:Colors.purple,
                width: constraints.maxWidth * 1,
                height: constraints.maxHeight * 0.375,
                child: InkWell(),
              ),
              Container(
                color:Colors.black54,
                height:constraints.maxHeight * 0.125
              )
            ],
          ),
        ),
      ),
    );
  }
}
