import 'package:flutter/cupertino.dart';

class BtnProvider with ChangeNotifier {

  bool _showTextFieldA = false;
  bool _showTextFieldB = false;
  bool _fixedTeams = false;
  bool _darkMode = false;

  bool get showTextFieldA => _showTextFieldA;
  bool get showTextFieldB => _showTextFieldB;
  bool get fixedTeams => _fixedTeams;
  bool get darkMode => _darkMode;

  void showTextField1(){
    _showTextFieldA = true;
    notifyListeners();
  }

  void showTextField2(){
    _showTextFieldB = true;
    notifyListeners();
  }

  void fixedTeamsGameTrue(){
    _fixedTeams = true;
    notifyListeners();
  }
  void fixedTeamsGameFalse(){
    _fixedTeams = false;
    notifyListeners();
  }

  void switchDarkMode(){

    if (_darkMode == true){
      _darkMode = false;
    } else {
      _darkMode = true;
    }
    notifyListeners();
  }
}