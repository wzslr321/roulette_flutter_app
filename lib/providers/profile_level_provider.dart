import 'package:flutter/material.dart';

class ProfileLevel with ChangeNotifier{
  int level = 1;
  int moneyForLvl= 10;

  int get showLevel{
    return level;
  }

  int get moneyNeeded{
    return moneyForLvl * level;
  }

  void levelUp() {
    level += 1;

    notifyListeners();
  }
}