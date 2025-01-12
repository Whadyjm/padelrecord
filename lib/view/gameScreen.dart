import 'dart:math';

import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  final List<String> players;

  GameScreen({required this.players});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<dynamic> _teamA;
  late List<dynamic> _teamB;
  int _scoreA = 0;
  int _scoreB = 0;
  int count1 = 0;
  int count2 = 0;

  @override
  void initState() {
    super.initState();
    _assignTeams();
  }

  void _assignTeams() {
    final random = Random();
    final shuffledPlayers = List.from(widget.players)..shuffle(random);
    _teamA = shuffledPlayers.sublist(0, 2);
    _teamB = shuffledPlayers.sublist(2, 4);
  }

  void _updateScore(int team) {
    setState(() {
      if (team == 1) {
        _scoreA++;
      } else {
        _scoreB++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: const Text('Partida de Padel'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _scoreA = 0;
                _scoreB = 0;
                count1 = 0;
                count2 = 0;
              });
            },
            icon: const Icon(Icons.refresh_rounded),)
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white.withOpacity(0.15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_teamA[0], style: const TextStyle(fontWeight: FontWeight.bold),),
                      Text(_teamA[1], style: const TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                    ),
                    child: Center(child: Text('$_scoreA',
                      style: const TextStyle(color: Colors.white, fontSize: 25),))),
                const Text('VS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black,
                    ),
                    child: Center(child: Text('$_scoreB',
                      style: const TextStyle(color: Colors.white, fontSize: 25),))),
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white24,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_teamB[0], style: const TextStyle(fontWeight: FontWeight.bold),),
                      Text(_teamB[1], style: const TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: (){
                  setState(() {
                    count1++;
                    if (count1 == 1){
                      _scoreA = 15;
                    } else if (count1 == 2){
                      _scoreA = 30;
                    } else if (count1 == 3){
                      _scoreA = 40;
                    }
                  });
                },
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.lightGreenAccent,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Icon(Icons.add, color: Colors.grey.shade700,)
                ),
              ),
              MaterialButton(
                onPressed: (){
                  setState(() {
                    count2++;
                    if (count2 == 1){
                      _scoreB = 15;
                    } else if (count2 == 2){
                      _scoreB = 30;
                    } else if (count2 == 3){
                      _scoreB = 40;
                    }
                  });
                },
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.lightGreenAccent,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Icon(Icons.add, color: Colors.grey.shade700,)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}