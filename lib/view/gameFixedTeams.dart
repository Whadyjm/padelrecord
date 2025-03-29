import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:padel_record/provider/btnProvider.dart';
import 'package:padel_record/provider/winnerProvider.dart';
import 'package:padel_record/widgets/addBtn.dart';
import 'package:padel_record/widgets/gameList.dart';
import 'package:padel_record/widgets/teamGameScore.dart';
import 'package:provider/provider.dart';
import '../provider/playerProvider.dart';
import '../provider/puntosProvider.dart';
import '../widgets/deuceLabel.dart';
import '../widgets/gameScore.dart';
import '../widgets/gameSelector.dart';
import '../widgets/newGameBtn.dart';

class GameFixedTeams extends StatelessWidget {
  const GameFixedTeams({super.key});

  @override
  Widget build(BuildContext context) {

    final puntosProvider = Provider.of<PuntosProvider>(context);
    final btnProvider = Provider.of<BtnProvider>(context);
    final winnerProvider = Provider.of<WinnerProvider>(context);

    return Stack(
        alignment: Alignment.topCenter,
        children: [
          Scaffold(
            backgroundColor: btnProvider.darkMode ? Colors.grey.shade900:Colors.grey.shade300,
            appBar: AppBar(
              backgroundColor: btnProvider.darkMode ? Colors.grey.shade900:Colors.grey.shade300,
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_rounded, color: btnProvider.darkMode ? Colors.white:Colors.grey.shade800,),
                onPressed: () {
                  Navigator.pop(context);
                },),
              title: const GameSelector(),
              actions: [
                IconButton(
                  onPressed: () {
                    puntosProvider.refresh();
                    puntosProvider.stopConfetti();
                  },
                  icon: Icon(Icons.refresh_rounded, size: 30, color: btnProvider.darkMode ? Colors.white:Colors.grey.shade800,),)
              ],
            ),
            body: Column(
              children: [
                const NewGameBtn(),
                const SizedBox(height: 40,),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Stack(
                    children:[
                      GameScore(),
                      DeuceLabel(),
                    ],
                  ),
                ),
                const TeamGameScore(),
                const AddRemoveBtns(),
                const SizedBox(height: 20,),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 8, top: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Partidas jugadas: ${winnerProvider.winner.length}', style: TextStyle(fontFamily: 'sf-pro-display', fontWeight: FontWeight.w700, color: btnProvider.darkMode ? Colors.white70:Colors.grey.shade700))),
                ),
                const GameList(),
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
