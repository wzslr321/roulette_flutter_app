import 'package:flutter/material.dart';

enum lotQuality {
  Silver,
  Gold,
}

class Lots with ChangeNotifier {

  int lots = 0;

  int get lotsQuantity {
    return lots;
  }

  void addLot(lotQuality lotType) {
    lotType.index == 0 ? lots += 1 : lots += lotType.index + 4;
    notifyListeners();
  }

}
