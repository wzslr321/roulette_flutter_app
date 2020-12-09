import 'package:flutter/material.dart';

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

List<Color> rouletteColors = [
  Colors.redAccent,
  Colors.black87,
  Colors.green,
  Colors.redAccent,
  Colors.black87,
  Colors.redAccent,
  Colors.green,
  Colors.black87,
];

List<double> itemsIndex = [
  125,
  250,
  375,
  500,
  625,
  750,
  875,
  1000
];

List<Map<double, int>> colorMaxValues = [
  {1.0: 125},
  {2.0: 250},
  {3.0: 375},
  {4.0: 500},
  {5.0: 625},
  {6.0: 750},
  {7.0: 875},
  {8.0: 1000},
];

List<double> redPartValues = [
  2.0,
  5.0,
  7.0,
];

List<double> greenPartValues = [
  4.0,
  9.0
];