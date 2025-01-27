import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:padel_record/models/playerModel.dart';

class PlayerProvider with ChangeNotifier{
  List<PlayerModel> _players = [];
  List<PlayerModel> _playersTeamA = [];
  List<PlayerModel> _playersTeamB = [];
  List<List<PlayerModel>> _teams = [];
  List<dynamic> _teamA = [];
  List<dynamic> _teamB = [];

  List<PlayerModel> get players => _players;
  List<PlayerModel> get playersTeamA => _playersTeamA;
  List<PlayerModel> get playersTeamB => _playersTeamB;
  List<List<PlayerModel>> get teams => _teams;

  List<dynamic> get teamA => _teamA;
  List<dynamic> get teamB => _teamB;

  void addPlayer(String nombre) {
      _players.add(PlayerModel(nombre: nombre));
      notifyListeners();
  }

  void addPlayersTeamA(String nombre) {
    _playersTeamA.add(PlayerModel(nombre: nombre));
    notifyListeners();
  }

  void removePlayersTeamA(index) {
    _playersTeamA.remove(index);
    notifyListeners();
  }

  void addPlayersTeamB(String nombre) {
    _playersTeamB.add(PlayerModel(nombre: nombre));
    notifyListeners();
  }

  void removePlayersTeamB(index) {
    _playersTeamB.remove(index);
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