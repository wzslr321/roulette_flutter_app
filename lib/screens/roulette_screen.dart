import 'package:flutter/material.dart';
import 'package:shopping_helper/models/default_text_class.dart';

class RouletteScreen extends StatefulWidget {
  static const routeName = '/roulette';

  @override
  _RouletteScreenState createState() => _RouletteScreenState();
}

class _RouletteScreenState extends State<RouletteScreen> with SingleTickerProviderStateMixin {

  Animation _animation;
  AnimationController _animationController;

  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds:5));
    _animationController.addListener((){
      setState(() {

      });
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    _animation = CurvedAnimation(parent: _animationController, curve:Curves.elasticInOut);
    _animation = Tween(begin: -0.5, end: 0.5).animate(_animation);

    return Container(
        width:queryData.size.width,
        height: queryData.size.height,
        child: Center(
          child:Column(
            children:<Widget> [
              Material(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                elevation: 20.0,
                color: Colors.cyan.shade900,
                child: Container(
                  width: queryData.size.width * 0.5,
                  height: queryData.size.height * 0.3,
                  child:DefaultTextWidget(
                    textContent: 'Roulette',
                  )
                ),
              ),
              Transform(
                alignment: FractionalOffset(0.5,0.0),
                transform: Matrix4.rotationZ(_animation.value),
                child: Container(
                  child:Text("!!!!!!!"),
                ),
              )
            ],
          )
        ),
    );
  }
}
