import 'package:flutter/cupertino.dart';

import '../models/winnerModel.dart';

class WinnerProvider with ChangeNotifier{

  final List<WinnerModel> _winner = [];

  List<WinnerModel> get winner => _winner;


  void addWinner(player1, player2, games){
    _winner.add(WinnerModel(player1: player1.toString(), player2: player2.toString(), games: games.toString()));

    notifyListeners();
  }

  void clearWinner(){
    _winner.clear();

    notifyListeners();
  }
}