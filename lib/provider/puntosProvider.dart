import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class PuntosProvider with ChangeNotifier {
  ///Variables
  int _scoreA = 0;
  int _scoreB = 0;
  int _counterA = 0;
  int _counterB = 0;
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
  bool _advA = false;
  bool _advB = false;

  ConfettiController _controller = ConfettiController();

  ///Getters
  int get scoreA => _scoreA;
  int get scoreB => _scoreB;
  int get counterA => _counterA;
  int get counterB => _counterB;
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
  bool get advA => _advA;
  bool get advB => _advB;

  ConfettiController get controller => _controller;

  ///muestra banner de empate
  void deuceRequest() {
    if (_counterA == 3 && _counterB == 3) {
      _empate = true;
    } else {
      _empate = false;
    }
    notifyListeners();
  }

  ///ventaja de TeamA
  void advTeamA() {
    if (_counterA == 4 && _counterB == 3 && _empate == true) {
      _advA = true;
    }
  }
///TODO: mostrar equipo ganador!!!
  /// Añade puntos a Team A
  void addScoreA() {
    if (_empate) {
      if (_advA) {
        _scoreA = 0;
        _scoreB = 0;
        _counterA = 0;
        _counterB = 0;
        _gameTeamA++;
        _empate = false;
        _advA = false;
        _advB = false;
      } else if (_advB) {
        _advB = false;
      } else {
        _advA = true;
      }
    } else {
      _counterA++;
      if (_counterA == 1) {
        _scoreA = 15;
      } else if (_counterA == 2) {
        _scoreA = 30;
      } else if (_counterA == 3) {
        _scoreA = 40;
        deuceRequest();
      } else if (_counterA == 4) {
        _scoreA = 0;
        _scoreB = 0;
        _counterA = 0;
        _counterB = 0;
        _gameTeamA++;
      }
    }
    notifyListeners();
  }

  /// Añade puntos a Team B
  void addScoreB() {
    if (_empate) {
      if (_advB) {
        _scoreA = 0;
        _scoreB = 0;
        _counterA = 0;
        _counterB = 0;
        _gameTeamB++;
        _empate = false;
        _advA = false;
        _advB = false;
      } else if (_advA) {
        _advA = false;
      } else {
        _advB = true;
      }
    } else {
      _counterB++;
      if (_counterB == 1) {
        _scoreB = 15;
      } else if (_counterB == 2) {
        _scoreB = 30;
      } else if (_counterB == 3) {
        _scoreB = 40;
        deuceRequest();
      } else if (_counterB == 4) {
        _scoreA = 0;
        _scoreB = 0;
        _counterA = 0;
        _counterB = 0;
        _gameTeamB++;
      }
    }
    notifyListeners();
  }

  void refresh() {
    _scoreA = 0;
    _scoreB = 0;
    _counterA = 0;
    _counterB = 0;
    _firstGame1 = false;
    _secondGame1 = false;
    _thirdGame1 = false;

    _firstGame2 = false;
    _secondGame2 = false;
    _thirdGame2 = false;

    _advA = false;
    _advB = false;

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

  void gameByTeam() {
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
}
