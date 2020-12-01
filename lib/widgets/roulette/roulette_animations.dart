import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pie_chart/pie_chart.dart';
import 'dart:math';

import '../../models/default_text_class.dart';
import '../../providers/roulette_state_provider.dart';

class RouletteAnimation extends StatefulWidget {
  @override
  RouletteAnimationState createState() => RouletteAnimationState();
}

class RouletteAnimationState extends State<RouletteAnimation>
    with TickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;

  Animation _animationAlignment;
  AnimationController _animationAlignmentController;

  void alignmentAnimate() {
    _animationAlignmentController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _animationAlignmentController.addListener(() {
      if (_animationAlignmentController.isCompleted) {
        _animationAlignmentController.reverse();
      }
    });
    _animationAlignmentController.forward();
  }

  void _setNewValuesOnRoll() {
    _rouletteState.setTweenVal(0);
    // _rouletteState.setTweenVal(new Random().nextInt(1000000) / 100000 + 20);
    // String _convTweenVal = _rouletteState.tweenValue.toString();
    // List<String> _nonAcceptableValues = [
    //   "125",
    //   "250",
    //   "375",
    //   "500",
    //   "625",
    //   "750",
    //   "875",
    //   "1000",
    // ];
    // for(var i = 0; i < _nonAcceptableValues.length; i++){
    //   if(_convTweenVal.substring(3,6) == _nonAcceptableValues[i]){
    //     _rouletteState.setTweenVal(new Random().nextInt(10000) / 1000 + 20);
    //   }
    // }

    _rouletteState.resetWinner();
    _rouletteState.start();
  }

  void roll() {
    _setNewValuesOnRoll();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
      value: 0.1,
      lowerBound: 0.0,
      upperBound: 1.0,
    );
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        _animationController.forward();
        _rouletteState.end();
      } else {
        _animationController.isDismissed
            ? _animationController.forward()
            : setState(() {});
      }
    });

    _animationController.forward();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _animationAlignmentController = AnimationController(vsync: this);
  }

  @override
  dispose() {
    super.dispose();
    _animationController.dispose();
  }

  RouletteState _rouletteState;

  @override
  Widget build(BuildContext context) {



    MediaQueryData queryData = MediaQuery.of(context);

    RouletteState _stateProvider = Provider.of<RouletteState>(context);

    _rouletteState = _stateProvider;

    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _animation =
        Tween(begin: -1.0, end: _stateProvider.tweenValue).animate(_animation);

    _animationAlignment = CurvedAnimation(
        parent: _animationAlignmentController, curve: Curves.elasticInOut);
    _animationAlignment =
        Tween(begin: 0.0, end: 1.0).animate(_animationAlignment);

    Map<String, double> dataMap = {
      "Red1": 1,
      "Black1": 1,
      "Green1": 1,
      "Red2": 1,
      "Black2": 1,
      "Green2": 1,
      "Red3": 1,
      "Black3": 1
    };

    List<Color> _rouletteColors = [
      Colors.redAccent,
      Colors.black87,
      Colors.green,
      Colors.redAccent,
      Colors.black87,
      Colors.redAccent,
      Colors.green,
      Colors.black87,
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.00),
      ),
      width: queryData.size.width * 0.5,
      child: Column(
        children: <Widget>[
          Transform(
            alignment: const FractionalOffset(2.0, 0.0),
            transform: Matrix4.rotationZ(_animationAlignment.value),
            child: RotationTransition(
              turns: _animation,
              child: PieChart(
                dataMap: dataMap,
                colorList: _rouletteColors,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                initialAngleInDegree: 0,
                chartType: ChartType.disc,
                ringStrokeWidth: 32,
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: false,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: false,
                  showChartValues: false,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                ),
              ),
            ),
          ),
          SizedBox(
            height: queryData.size.height * 0.02,
            width: queryData.size.width * 0.005,
            child: Container(
              color: Colors.black,
            ),
          ),
          Container(
            width: queryData.size.width * 0.2,
            child: ElevatedButton(
                onPressed: () {
                  roll();
                  alignmentAnimate();
                },
                child: const DefaultTextWidget(
                  textContent: 'Roll!',
                )),
          )
        ],
      ),
    );
  }
}
