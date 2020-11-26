import 'package:flutter/material.dart';

import '../models/default_text_class.dart';
import '../widgets/roulette_item.dart';

class RouletteScreen extends StatefulWidget {
  static const routeName = '/roulette';

  @override
  _RouletteScreenState createState() => _RouletteScreenState();
}

class _RouletteScreenState extends State<RouletteScreen>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;



  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1), value: 0.25, lowerBound: 0.25, upperBound: 0.5);
    _animationController.addListener(() {
      _animationController.isCompleted
          ? _animationController.forward()
          : _animationController.isDismissed
              ? _animationController.forward()
              : setState(() {});
    });

    _animationController.forward();
  }

  @override
  dispose(){
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
    _animation = Tween(begin:-0.5, end: 0.5).animate(_animation);

    return Container(
      width: queryData.size.width,
      height: queryData.size.height,
      child: Center(
          child: Column(
        children: <Widget>[
          RotationTransition(
            turns:_animation,
            child: Container(
                width: queryData.size.width * 0.5,
                height: queryData.size.height * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.00),
                ),
                child: Row(
                  children: <Widget>[
                    RouletteItem('X2', Colors.black, BorderRadius.only(topLeft:Radius.circular(100),bottomLeft:Radius.circular(100)),),
                    RouletteItem('X2', Colors.red, BorderRadius.only(topRight:Radius.circular(100),bottomRight:Radius.circular(100)),),
                  ],
                )),
          ),
          // Transform(
          //   alignment: FractionalOffset(0.5,0.0),
          //   transform: Matrix4.rotationZ(_animation.value),
          //   child: Container(
          //     child:Text("!!!!!!!"),
          //   ),
          // )
        ],
      )),
    );
  }
}
