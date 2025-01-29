import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class PuntosProvider with ChangeNotifier {
  int _scoreA = 0;
  int _scoreB = 0;
  int _count1 = 0;
  int _count2 = 0;
  int _set = 1;
  int _setsTeamA = 0;
  int _setsTeamB = 0;

  bool _firstSet1 = false;
  bool _secondSet1 = false;
  bool _thirdSet1 = false;
  bool _firstSet2 = false;
  bool _secondSet2 = false;
  bool _thirdSet2 = false;
  bool _confetti = false;
  bool _empate = false;
  bool _adv1 = false;
  bool _adv2 = false;

  ConfettiController _controller = ConfettiController();

  int get scoreA => _scoreA;
  int get scoreB => _scoreB;
  int get count1 => _count1;
  int get count2 => _count2;
  int get set => _set;
  int get setsTeamA => _setsTeamA;
  int get setsTeamB => _setsTeamB;

  bool get firstSet1 => _firstSet1;
  bool get secondSet1 => _secondSet1;
  bool get thirdSet1 => _thirdSet1;
  bool get firstSet2 => _firstSet2;
  bool get secondSet2 => _secondSet2;
  bool get thirdSet2 => _thirdSet2;
  bool get confetti => _confetti;
  bool get empate => _empate;
  bool get adv1 => _adv1;
  bool get adv2 => _adv2;

  ConfettiController get controller => _controller;

  void addScoreA(){
    if (_count1 == 12) {
      return;
    }
    _count1++;
    if (_count1 == 1){
      _scoreA = 15;
    } else if (count1 == 2){
      _scoreA = 30;
    } else if (count1 == 3){
      _scoreA = 40;
    } else if (count1 == 4){
      _scoreA = 0;
    } else if (count1 == 5){
      _scoreA = 15;
    } else if (count1 == 6){
      _scoreA = 30;
    } else if (count1 == 7){
      _scoreA = 40;
    } else if (count1 == 8){
      _scoreA = 0;
    } else if (count1 == 9){
      _scoreA = 15;
    } else if (count1 == 10){
      _scoreA = 30;
    } else if (count1 == 11){
      _scoreA = 40;
    } else if (count1 == 12){
      _scoreA = 0;
    }
    notifyListeners();
  }

  void backScoreA(){
    if (_scoreA > 0) {
      _count1--;
      if (count1 == 0){
        _scoreA = 0;
      } else if (count1 == 1){
        _scoreA = 15;
      } else if (count1 == 2){
        _scoreA = 30;
      } else if (count1 == 3){
        _scoreA = 40;
      }
    }
    notifyListeners();
  }

  void addScoreB(){
    if (_count2 == 12) {
      return;
    }
    _count2++;
    if (_count2 == 1){
      _scoreB = 15;
    } else if (count2 == 2){
      _scoreB = 30;
    } else if (count2 == 3){
      _scoreB = 40;
    } else if (count2 == 4){
      _scoreB = 0;
    } else if (count2 == 5){
      _scoreB = 15;
    } else if (count2 == 6){
      _scoreB = 30;
    } else if (count2 == 7){
      _scoreB = 40;
    } else if (count2 == 8){
      _scoreB = 0;
    } else if (count2 == 9){
      _scoreB = 15;
    } else if (count2 == 10){
      _scoreB = 30;
    } else if (count2 == 11){
      _scoreB = 40;
    } else if (count2 == 12){
      _scoreB = 0;
    }
    notifyListeners();
  }

  void backScoreB(){
    if (_scoreB > 0) {
      _count2--;
      if (_count2 == 0){
        _scoreB = 0;
      } else if (_count2 == 1){
        _scoreB = 15;
      } else if (_count2 == 2){
        _scoreB = 30;
      } else if (_count2 == 3){
        _scoreB = 40;
      }
    }
    notifyListeners();
  }

  void refresh(){
    _scoreA = 0;
    _scoreB = 0;
    _count1 = 0;
    _count2 = 0;
    _set = 1;
    _firstSet1 = false;
    _secondSet1 = false;
    _thirdSet1 = false;

    _firstSet2 = false;
    _secondSet2 = false;
    _thirdSet2 = false;
    notifyListeners();
  }

  void addSet(){

    if (_set < 3){
      _set++;
    }

    notifyListeners();
  }
  void removeSet(){
    if (set > 1){
      _set--;
    }
    notifyListeners();
  }

  void sets1 (int count){
    if (count == 3){
      _firstSet1 = true;
    } else if (count == 7){
      _firstSet1 = true;
      _secondSet1 = true;
    } else if (count == 11){
      _firstSet1 = true;
      _secondSet1 = true;
      _thirdSet1 = true;
    }
    notifyListeners();
  }

  void sets2 (int count){
    if (count == 3){
      _firstSet2 = true;
    } else if (count == 7){
      _firstSet2 = true;
      _secondSet2 = true;
    } else if (count == 11){
      _firstSet2 = true;
      _secondSet2 = true;
      _thirdSet2 = true;
    }
    notifyListeners();
  }

  void setsByTeam (){
    if (_firstSet1 == true){
      _setsTeamA = 1;
    } else if (_secondSet1 == true) {
      _setsTeamA = 2;
    } else if (_thirdSet1 == true) {
      _setsTeamA = 3;
    }

    if (_firstSet2 == true){
      _setsTeamB = 1;
    } else if (_secondSet2 == true) {
      _setsTeamB = 2;
    } else if (_thirdSet2 == true) {
      _setsTeamB = 3;
    }
  }

  void startConfetti(){
    _controller.play();
    notifyListeners();
  }

  void stopConfetti(){
    _controller.stop();
    notifyListeners();
  }

  void deuce(){
    if (_empate == false){
      _empate = true;
    } else {
     _empate = false;
    }
    notifyListeners();
  }

  void advA(){
    if (_adv1 == false){
      _adv1 = true;
    } else {
      _adv1 = false;
    }
    notifyListeners();
  }

  void advB(){
    if (_adv2 == false){
      _adv2 = true;
    } else {
      _adv2 = false;
    }
    notifyListeners();
  }
}