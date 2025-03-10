import 'package:flutter/cupertino.dart';

class BtnProvider with ChangeNotifier {

  bool _showTextFieldA = false;
  bool _showTextFieldB = false;
  bool _fixedTeams = false;
  bool _darkMode = false;
  bool _goldPoint = false;
  bool _ventaja = true;

  bool get showTextFieldA => _showTextFieldA;
  bool get showTextFieldB => _showTextFieldB;
  bool get fixedTeams => _fixedTeams;
  bool get darkMode => _darkMode;
  bool get goldPoint => _goldPoint;
  bool get ventaja => _ventaja;

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

    _darkMode = !_darkMode;
    notifyListeners();
  }

  void puntoDeOro(){
    if (_goldPoint == false){
      _goldPoint = true;
      _ventaja = false;
    }
    notifyListeners();
  }

  void sistDeVentaja(){
    if (_ventaja == false){
      _ventaja = true;
      _goldPoint = false;
    }
    notifyListeners();
  }
}