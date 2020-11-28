import 'package:flutter/material.dart';

enum possibleBets {
  Black,
  Red,
}

class UsersBet with ChangeNotifier{

  possibleBets userBet;

  possibleBets get usersBet{
    return userBet;
  }

  void betBlack(){
    userBet = possibleBets.Black;
    notifyListeners();
  }
  void betRed(){
    userBet = possibleBets.Red;
    notifyListeners();
  }


}