import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class PuntosProvider with ChangeNotifier {
  int _scoreA = 0;
  int _scoreB = 0;
  int _count1 = 0;
  int _count2 = 0;
  int _game = 1;
  int _gameTeamA = 0;
  int _gameTeamB = 0;

  bool _firstGame1 = false;
  bool _secondGame1 = false;
  bool _thirdGame1 = false;
  bool _fourthGame1 = false;
  bool _fifthGame1 = false;
  bool _sixthGame1 = false;

  bool _firstGame2 = false;
  bool _secondGame2 = false;
  bool _thirdGame2 = false;
  bool _fourthGame2 = false;
  bool _fifthGame2 = false;
  bool _sixthGame2 = false;

  bool _confetti = false;
  bool _empate = false;
  bool _adv1 = false;
  bool _adv2 = false;

  ConfettiController _controller = ConfettiController();

  int get scoreA => _scoreA;
  int get scoreB => _scoreB;
  int get count1 => _count1;
  int get count2 => _count2;
  int get game => _game;
  int get setsTeamA => _gameTeamA;
  int get setsTeamB => _gameTeamB;

  bool get firstGame1 => _firstGame1;
  bool get secondGame1 => _secondGame1;
  bool get thirdGame1 => _thirdGame1;
  bool get fourthGame1 => _fourthGame1;
  bool get fifthGame1 => _fifthGame1;
  bool get sixthGame1 => _sixthGame1;

  bool get firstGame2 => _firstGame2;
  bool get secondGame2 => _secondGame2;
  bool get thirdGame2 => _thirdGame2;
  bool get fourthGame2 => _fourthGame2;
  bool get fifthGame2 => _fifthGame2;
  bool get sixthGame2 => _sixthGame2;

  bool get confetti => _confetti;
  bool get empate => _empate;
  bool get adv1 => _adv1;
  bool get adv2 => _adv2;

  ConfettiController get controller => _controller;

  void addScoreA() {
    if (_count1 == 12) {
      return;
    }
    _count1++;
    if (_count1 == 1) {
      _scoreA = 15;
    } else if (count1 == 2) {
      _scoreA = 30;
    } else if (count1 == 3) {
      _scoreA = 40;
    } else if (count1 == 4) {
      _scoreA = 0;
    } else if (count1 == 5) {
      _scoreA = 15;
    } else if (count1 == 6) {
      _scoreA = 30;
    } else if (count1 == 7) {
      _scoreA = 40;
    } else if (count1 == 8) {
      _scoreA = 0;
    } else if (count1 == 9) {
      _scoreA = 15;
    } else if (count1 == 10) {
      _scoreA = 30;
    } else if (count1 == 11) {
      _scoreA = 40;
    } else if (count1 == 12) {
      _scoreA = 0;
    }
    notifyListeners();
  }

  void backScoreA() {
    if (_scoreA > 0) {
      _count1--;
    }
    notifyListeners();
  }

  void addScoreB() {
    if (_count2 == 12) {
      return;
    }
    _count2++;
    if (_count2 == 1) {
      _scoreB = 15;
    } else if (count2 == 2) {
      _scoreB = 30;
    } else if (count2 == 3) {
      _scoreB = 40;
    } else if (count2 == 4) {
      _scoreB = 0;
    } else if (count2 == 5) {
      _scoreB = 15;
    } else if (count2 == 6) {
      _scoreB = 30;
    } else if (count2 == 7) {
      _scoreB = 40;
    } else if (count2 == 8) {
      _scoreB = 0;
    } else if (count2 == 9) {
      _scoreB = 15;
    } else if (count2 == 10) {
      _scoreB = 30;
    } else if (count2 == 11) {
      _scoreB = 40;
    } else if (count2 == 12) {
      _scoreB = 0;
    }
    notifyListeners();
  }

  void backScoreB() {
    if (_scoreB > 0) {
      _count2--;
      if (_count2 == 0) {
        _scoreB = 0;
      } else if (_count2 == 1) {
        _scoreB = 15;
      } else if (_count2 == 2) {
        _scoreB = 30;
      } else if (_count2 == 3) {
        _scoreB = 40;
      }
    }
    notifyListeners();
  }

  void refresh() {
    _scoreA = 0;
    _scoreB = 0;
    _count1 = 0;
    _count2 = 0;
    _firstGame1 = false;
    _secondGame1 = false;
    _thirdGame1 = false;

    _firstGame2 = false;
    _secondGame2 = false;
    _thirdGame2 = false;

    _adv1 = false;
    _adv2 = false;

    if (_empate == true) {
      _empate = false;
    }
    notifyListeners();
  }

  void addGame() {
    if (_game < 6) {
      _game++;
    }

    notifyListeners();
  }

  void removeSet() {
    if (game > 1) {
      _game--;
    }
    notifyListeners();
  }

  void sets1(int count) {
    if (count == 3) {
      _firstGame1 = true;
    } else if (count == 7) {
      _firstGame1 = true;
      _secondGame1 = true;
    } else if (count == 11) {
      _firstGame1 = true;
      _secondGame1 = true;
      _thirdGame1 = true;
    }
    notifyListeners();
  }

  void sets2(int count) {
    if (count == 3) {
      _firstGame2 = true;
    } else if (count == 7) {
      _firstGame2 = true;
      _secondGame2 = true;
    } else if (count == 11) {
      _firstGame2 = true;
      _secondGame2 = true;
      _thirdGame2 = true;
    }
    notifyListeners();
  }

  void setsByTeam() {
    if (_firstGame1 == true) {
      _gameTeamA = 1;
    } else if (_secondGame1 == true) {
      _gameTeamA = 2;
    } else if (_thirdGame1 == true) {
      _gameTeamA = 3;
    }

    if (_firstGame2 == true) {
      _gameTeamB = 1;
    } else if (_secondGame2 == true) {
      _gameTeamB = 2;
    } else if (_thirdGame2 == true) {
      _gameTeamB = 3;
    }
  }

  void startConfetti() {
    _controller.play();
    notifyListeners();
  }

  void stopConfetti() {
    _controller.stop();
    notifyListeners();
  }

  void deuce() {
    if (_empate == false) {
      _empate = true;
    } else {
      _empate = false;
    }
    notifyListeners();
  }

  void advA() {
    if (_adv1 == false) {
      _adv1 = true;
    } else {
      _adv1 = false;
    }
    notifyListeners();
  }

  void advB() {
    if (_adv2 == false) {
      _adv2 = true;
    } else {
      _adv2 = false;
    }
    notifyListeners();
  }
}
