import 'package:flutter/material.dart';

class RouletteState with ChangeNotifier{
  bool _didStart = false;
  bool _didEnd;
  double _tweenVal = 0.0;
  bool _isWinner;
  bool _didEndRed;

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

  bool get isResultRed{
    return _didEndRed;
  }


  void start() {
    _didStart = true;
    notifyListeners();
  }


  void end() {
    _didEnd = true;
    notifyListeners();
  }

  void resetEnd() {
    _didEnd = null;
  }

  void setTweenVal(double val) {
    _tweenVal = val;
    notifyListeners();
  }

  void setWinner(){
    _isWinner = true;
  }
  void setLoser(){
    _isWinner = false;
  }
  void resetWinner() {
    _isWinner = null;
  }

  void resultIsRed() {
    _didEndRed = true;
  }

  void resultIsBlack(){
    _didEndRed = false;
  }


}