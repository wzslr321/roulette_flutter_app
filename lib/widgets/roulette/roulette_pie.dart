import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import './roulette_static_data.dart';

class RoulettePie extends StatelessWidget {

  final Animation animationAlignment;
  final Animation spinAnimation;

  RoulettePie({
    this.animationAlignment,
    this.spinAnimation
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: const FractionalOffset(2.0, 0.0),
      transform: Matrix4.rotationZ(animationAlignment.value),
      child: RotationTransition(
        turns: spinAnimation,
        child: PieChart(
          dataMap: dataMap,
          colorList: rouletteColors,
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
    );
  }
}
