import 'dart:math';

import 'package:flutter/material.dart';
import 'package:padel_record/models/playerModel.dart';
import 'package:padel_record/provider/playerProvider.dart';
import 'package:padel_record/provider/puntosProvider.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {


  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  int _scoreA = 0;
  int _scoreB = 0;
  int count1 = 0;
  int count2 = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final playerProvider = Provider.of<PlayerProvider>(context);
    final puntosProvider = Provider.of<PuntosProvider>(context);

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
              puntosProvider.refresh();
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
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    color: Colors.black,
                    ),
                    child: Center(child: Text('${puntosProvider.scoreA}',
                      style: const TextStyle(color: Colors.white, fontSize: 25),))),
                const Text('VS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black,
                    ),
                    child: Center(child: Text('${puntosProvider.scoreB}',
                      style: const TextStyle(color: Colors.white, fontSize: 25),))),
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
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  puntosProvider.backScoreA();
                }, icon: const Icon(Icons.arrow_back_rounded)),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: IconButton(
                      onPressed: (){
                        puntosProvider.addScoreA();
                      },
                      icon: const Icon(Icons.add, color: Colors.white,)),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: IconButton(
                      onPressed: (){
                        puntosProvider.addScoreB();
                      },
                      icon: const Icon(Icons.add, color: Colors.white,)),
                ),
                IconButton(onPressed: (){
                  setState(() {
                    puntosProvider.backScoreB();
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