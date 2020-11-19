import 'package:flutter/material.dart';

class Lot {
  final DateTime date = DateTime.now();
  final bool isExpired;
  final String lotQuality;

  Lot({this.isExpired = false, this.lotQuality});
}

enum lotQuality {
  Silver,
  Gold,
  Platinum,
  Diamond
}

class Lots with ChangeNotifier {

  int lots = 0;

  int get lotsQuantity {
    return lots;
  }

  void addLot(lotQuality lotType) {
    lots += lotType.index + 1;

    notifyListeners();
  }
}
