import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:padel_record/models/playerModel.dart';

class PlayerProvider with ChangeNotifier{
  List<PlayerModel> _players = [];
  List<List<PlayerModel>> _teams = [];
  List<dynamic> _teamA = [];
  List<dynamic> _teamB = [];

  List<PlayerModel> get players => _players;
  List<List<PlayerModel>> get teams => _teams;

  List<dynamic> get teamA => _teamA;
  List<dynamic> get teamB => _teamB;

  void addPlayer(String nombre) {
      _players.add(PlayerModel(nombre: nombre));
      notifyListeners();
  }

  void assignTeams(){
    final random = Random();
    final shuffledPlayers = List.from(_players)..shuffle(random);
    _teamA = shuffledPlayers.sublist(0,2);
    _teamB = shuffledPlayers.sublist(2,4);
    notifyListeners();
  }

  void removePlayer(index) {
    _players.remove(index);
    notifyListeners();
  }

}