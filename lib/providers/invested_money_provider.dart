import 'package:flutter/material.dart';

class InvestedMoney with ChangeNotifier{
  int amount = 0;

  int get investedMoney{
    return amount;
  }

  void investMoney(int money){
    amount += money;
  }

  void resetInvestmentMoney(){
    amount = 0;
  }

}