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
        backgroundColor: Colors.grey.shade300,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('sets', style: TextStyle(fontWeight: FontWeight.bold),),
                  const VerticalDivider(thickness: 1,),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.remove)),
                  Center(child: Text('3',
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 20),)),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
                ],
              )),
        ),
        actions: [
          IconButton(
            onPressed: () {
              puntosProvider.refresh();
            },
            icon: const Icon(Icons.refresh_rounded, size: 30,),)
        ],
      ),
      body: Column(
        children: [
          MaterialButton(
            onPressed: (){
              playerProvider.assignTeams();
            },
            child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Nueva partida', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),),
                    Icon(Icons.sports_tennis_rounded, color: Colors.white, size: 20,)
                  ],
                )),
          ),
          const SizedBox(height: 40,),
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
                }, icon: const Icon(Icons.remove)),
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
                }, icon: const Icon(Icons.remove)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}