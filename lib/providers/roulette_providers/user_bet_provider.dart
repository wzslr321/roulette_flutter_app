import 'package:flutter/material.dart';
import 'roulette_state_provider.dart';

class UsersBet with ChangeNotifier {
  rouletteColorResult _userBet;

  rouletteColorResult get bet {
    return _userBet;
  }

  void betBlack() {
    _userBet = rouletteColorResult.Black;
    notifyListeners();
  }

  void betRed() {
    _userBet = rouletteColorResult.Red;
    notifyListeners();
  }

  void betGreen() {
    _userBet = rouletteColorResult.Green;
    notifyListeners();
  }
}
