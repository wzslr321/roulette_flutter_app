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

  void addGameMoney(moneyQuality moneyType) {
    moneyType.index == 0
        ? money -= 15
        : moneyType.index == 1
            ? money += 5
            : money += 1;
    notifyListeners();
  }

  void addMoney(int moneyAmount) {
    money += moneyAmount;
    notifyListeners();
  }

  void removeMoney(int moneyAmount) {
    money -= moneyAmount;
    notifyListeners();
  }
}
