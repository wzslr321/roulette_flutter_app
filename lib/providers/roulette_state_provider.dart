import 'package:flutter/material.dart';

class RouletteState with ChangeNotifier{
  bool didStart;
  bool didEnd;
  double tweenVal;

  double get tweenValue{
    return tweenVal;
  }

  bool get isActive{
    return didStart;
  }

  bool get isFinished{
    return didEnd;
  }

  void start() {
    didStart = true;
    notifyListeners();
  }

  void end() {
    didEnd = true;
    didStart = false;
    notifyListeners();
  }

  void setTweenVal(double val) {
    tweenVal = val;
  }

}