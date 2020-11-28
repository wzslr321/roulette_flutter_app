import 'package:flutter/material.dart';

class InvestedMoney with ChangeNotifier{
  int moneyInvested = 0;

  int get investedMoney{
    return moneyInvested;
  }

  void investMoney(int money){
    moneyInvested += money;
    notifyListeners();
  }
}