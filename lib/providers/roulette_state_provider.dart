import 'package:flutter/material.dart';

class RouletteState with ChangeNotifier{
  bool _didStart;
  bool _didEnd;
  double _tweenVal = 0.0;
  bool _isWinner;

  double get tweenValue{
    return _tweenVal;
  }

  bool get isActive{
    return _didStart;
  }

  bool get isFinished{
    return _didEnd;
  }


  bool get isWinner{
    return _isWinner;
  }


  void start() {
    _didStart = true;
    notifyListeners();
  }


  void end() {
    _didEnd = true;
    notifyListeners();
  }

  void setTweenVal(double val) {
    _tweenVal = val;
    notifyListeners();
  }


}