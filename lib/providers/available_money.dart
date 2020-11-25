import 'package:flutter/material.dart';

enum moneyQuality {
  Bronze,
  Gold,
  Grey,
}

class Money with ChangeNotifier {
  int money = 0;

  int get quantity {
    return money;
  }

  void addLot(moneyQuality moneyType) {
    moneyType.index == 0 ? money -= 15 : moneyType.index == 1 ? money  += 5 : money += 1;
    notifyListeners();
  }
}
