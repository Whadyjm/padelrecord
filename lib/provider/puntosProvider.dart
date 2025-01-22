import 'package:flutter/material.dart';

class PuntosProvider with ChangeNotifier {
  int _scoreA = 0;
  int _scoreB = 0;
  int _count1 = 0;
  int _count2 = 0;

  int get scoreA => _scoreA;
  int get scoreB => _scoreB;
  int get count1 => _count1;
  int get score2 => _count2;

  void addScoreA(){
    if (_count1 == 3) {
      return;
    }
    _count1++;
    if (_count1 == 1){
      _scoreA = 15;
    } else if (count1 == 2){
      _scoreA = 30;
    } else if (count1 == 3){
      _scoreA = 40;
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
    if (_count2 == 3) {
      return;
    }
    _count2++;
    if (_count2 == 1){
      _scoreB = 15;
    } else if (_count2 == 2){
      _scoreB = 30;
    } else if (_count2 == 3){
      _scoreB = 40;
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

    notifyListeners();
  }
}