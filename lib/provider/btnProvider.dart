import 'package:flutter/cupertino.dart';

class BtnProvider with ChangeNotifier {

  bool _showTextFieldA = false;
  bool _showTextFieldB = false;
  bool _fixedTeams = false;

  bool get showTextFieldA => _showTextFieldA;
  bool get showTextFieldB => _showTextFieldB;
  bool get fixedTeams => _fixedTeams;

  void showTextField1(){
    _showTextFieldA = true;
    notifyListeners();
  }

  void showTextField2(){
    _showTextFieldB = true;
    notifyListeners();
  }

  void fixedTeamsGame(){
    _fixedTeams = true;
    notifyListeners();
  }
}