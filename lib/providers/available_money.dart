import 'package:flutter/material.dart';

enum moneyQuality {
  Bronze,
  Gold,
}

class Money with ChangeNotifier {

  int money = 0;

  int get quantity {
    return money;
  }

  void addLot(moneyQuality moneyType) {
    moneyType.index == 0 ? money -= 15 : money += moneyType.index + 4;
    notifyListeners();
  }

}
