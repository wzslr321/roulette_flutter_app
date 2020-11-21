import 'package:flutter/material.dart';

enum moneyQuality {
  Silver,
  Gold,
}

class Money with ChangeNotifier {

  int money = 0;

  int get quantity {
    return money;
  }

  void addLot(moneyQuality moneyType) {
    moneyType.index == 0 ? money += 1 : money += moneyType.index + 4;
    notifyListeners();
  }

}
