import 'package:flutter/material.dart';

enum rouletteColorResult {
    Black,
    Red,
    Green,
}

class RouletteState with ChangeNotifier {
  bool _didStart = false;
  bool _didEnd;
  double _tweenVal;
  bool _isWinner;
  rouletteColorResult _result;

  double get tweenValue {
    return _tweenVal;
  }

  bool get isActive {
    return _didStart;
  }

  bool get isFinished {
    return _didEnd;
  }

  bool get isWinner {
    return _isWinner;
  }

  rouletteColorResult get rouletteResult {
    return _result;
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

  void setWinner() {
    _isWinner = true;
  }

  void setLoser() {
    _isWinner = false;
  }

  void resetWinner() {
    _isWinner = null;
  }

  void resultIsRed() {
    _result = rouletteColorResult.Red;
  }

  void resultIsBlack() {
    _result = rouletteColorResult.Black;
  }

  void resultIsGreen(){
    _result = rouletteColorResult.Green;
  }
}
