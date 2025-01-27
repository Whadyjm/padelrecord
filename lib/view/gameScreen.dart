import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:padel_record/provider/playerProvider.dart';
import 'package:padel_record/provider/puntosProvider.dart';
import 'package:padel_record/widgets/addRemoveBtns.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {


  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

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

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
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
                      const Text('sets', style: TextStyle(fontFamily: 'sf-pro-display', fontWeight: FontWeight.bold),),
                      const VerticalDivider(thickness: 1,),
                      IconButton(onPressed: (){
                        puntosProvider.removeSet();
                      }, icon: const Icon(Icons.remove)),
                      Center(child: Text('${puntosProvider.set}',
                        style: TextStyle(fontFamily: 'sf-pro-display', color: Colors.grey.shade800, fontSize: 20, fontWeight: FontWeight.w700),)),
                      IconButton(onPressed: (){
                        puntosProvider.addSet();
                      }, icon: const Icon(Icons.add)),
                    ],
                  )),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  puntosProvider.refresh();
                  puntosProvider.stopConfetti();
                },
                icon: const Icon(Icons.refresh_rounded, size: 30,),)
            ],
          ),
          body: Column(
            children: [
              MaterialButton(
                onPressed: (){
                  puntosProvider.refresh();
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
                        Text('Nueva partida', style: TextStyle(fontFamily: 'sf-pro-display', fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),),
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
                          Text(playerProvider.teamA[0].toString(), style: const TextStyle(fontFamily: 'sf-pro-display', fontSize: 15, color: Colors.black87, fontWeight: FontWeight.bold),),
                          Text(playerProvider.teamA[1].toString(), style: const TextStyle(fontFamily: 'sf-pro-display', fontSize: 15, color: Colors.black87, fontWeight: FontWeight.bold),),
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
                          style: const TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 25),))),
                    const Text('VS', style: TextStyle(fontFamily: 'sf-pro-display', fontWeight: FontWeight.w900, fontSize: 20),),
                    Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black,
                        ),
                        child: Center(child: Text('${puntosProvider.scoreB}',
                          style: const TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 25),))),
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
                          Text(playerProvider.teamB[0].toString(), style: const TextStyle(fontFamily: 'sf-pro-display', fontSize: 15, color: Colors.black87, fontWeight: FontWeight.bold),),
                          Text(playerProvider.teamB[1].toString(), style: const TextStyle(fontFamily: 'sf-pro-display', fontSize: 15, color: Colors.black87, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Visibility(
                            visible: puntosProvider.firstSet1 ? true:false,
                            child: const Text('1er Set', style: TextStyle(fontFamily: 'sf-pro-display', fontWeight: FontWeight.w600),)),
                        const SizedBox(height: 10,),
                        Visibility(
                            visible: puntosProvider.secondSet1 ? true:false,
                            child: const Text('2do Set', style: TextStyle(fontFamily: 'sf-pro-display', fontWeight: FontWeight.w600),)),
                        const SizedBox(height: 10,),
                        Visibility(
                            visible: puntosProvider.thirdSet1 ? true:false,
                            child: const Text('3er Set', style: TextStyle(fontFamily: 'sf-pro-display', fontWeight: FontWeight.w600),)),
                      ],
                    ),
                    Column(
                      children: [
                        Visibility(
                            visible: puntosProvider.firstSet2 ? true:false,
                            child: const Text('1er Set', style: TextStyle(fontFamily: 'sf-pro-display', fontWeight: FontWeight.w600),)),
                        const SizedBox(height: 10,),
                        Visibility(
                            visible: puntosProvider.secondSet2 ? true:false,
                            child: const Text('2do Set', style: TextStyle(fontFamily: 'sf-pro-display', fontWeight: FontWeight.w600),)),
                        const SizedBox(height: 10,),
                        Visibility(
                            visible: puntosProvider.thirdSet2 ? true:false,
                            child: const Text('3er Set', style: TextStyle(fontFamily: 'sf-pro-display', fontWeight: FontWeight.w600),)),
                      ],
                    ),
                  ],
                ),
              ),
              const AddRemoveBtns(),
              const SizedBox(height: 20,),
              const Divider()
            ],
          ),
        ),
        ConfettiWidget(
          numberOfParticles: 5,
          emissionFrequency: 0.25,
          confettiController: puntosProvider.controller,
          shouldLoop: true,
          blastDirectionality: BlastDirectionality.explosive,),
      ]
    );
  }
}