import 'dart:math';

import 'package:flutter/material.dart';
import 'package:padel_record/models/playerModel.dart';
import 'package:padel_record/provider/playerProvider.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {


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
    //_assignTeams();
  }

  // void _assignTeams() {
  //   final random = Random();
  //   final shuffledPlayers = List.from(widget.players)..shuffle(random);
  //   _teamA = shuffledPlayers.sublist(0, 2);
  //   _teamB = shuffledPlayers.sublist(2, 4);
  // }

  @override
  Widget build(BuildContext context) {

    final playerProvider = Provider.of<PlayerProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },),
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
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(playerProvider.teamA[0].toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
                      Text(playerProvider.teamA[1].toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                    ),
                    child: Center(child: Text('$_scoreA',
                      style: const TextStyle(color: Colors.white, fontSize: 40),))),
                const Text('VS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black,
                    ),
                    child: Center(child: Text('$_scoreB',
                      style: const TextStyle(color: Colors.white, fontSize: 40),))),
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(playerProvider.teamB[0].toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
                      Text(playerProvider.teamB[1].toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  setState(() {
                    if (_scoreA > 0) {
                      count1--;
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
                  });
                }, icon: const Icon(Icons.arrow_back_rounded)),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.lightGreenAccent,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: IconButton(
                      onPressed: (){
                        setState(() {
                          if (count1 == 3) {
                            return;
                          }
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
                      icon: Icon(Icons.add, color: Colors.grey.shade700,)),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.lightGreenAccent,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: IconButton(
                      onPressed: (){
                        setState(() {
                          if (count2 == 3) {
                            return;
                          }
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
                      icon: Icon(Icons.add, color: Colors.grey.shade700,)),
                ),
                IconButton(onPressed: (){
                  setState(() {
                    setState(() {
                      if (_scoreB > 0) {
                        count2--;
                        if (count2 == 0){
                          _scoreB = 0;
                        } else if (count2 == 1){
                          _scoreB = 15;
                        } else if (count2 == 2){
                          _scoreB = 30;
                        } else if (count2 == 3){
                          _scoreB = 40;
                        }
                      }
                    });
                  });
                }, icon: const Icon(Icons.arrow_forward_rounded)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}