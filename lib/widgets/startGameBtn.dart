import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/btnProvider.dart';
import '../provider/playerProvider.dart';
import '../provider/puntosProvider.dart';
import '../provider/winnerProvider.dart';
import '../view/gameScreen.dart';

class StartGameBtn extends StatelessWidget {
  const StartGameBtn({super.key});

  @override
  Widget build(BuildContext context) {

    final puntosProvider = Provider.of<PuntosProvider>(context);
    final winnerProvider = Provider.of<WinnerProvider>(context);
    final playerProvider = Provider.of<PlayerProvider>(context);
    final btnProvider = Provider.of<BtnProvider>(context);

    void startGame(PuntosProvider puntosProvider, WinnerProvider winnerProvider, PlayerProvider playerProvider, BtnProvider btnProvider, BuildContext context) {
      puntosProvider.refresh();
      winnerProvider.clearWinner();

      if (playerProvider.playersTeamA.length + playerProvider.playersTeamB.length == 4){
        btnProvider.fixedTeamsGameTrue();
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return GameScreen();
        }));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 1),
            content: Text('Se necesitan al menos 4 jugadores'),
          ),
        );
      }
    }
    return MaterialButton(
      onPressed: (){
        startGame(puntosProvider, winnerProvider, playerProvider, btnProvider, context);
      },
      child: Container(
          height: 50,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12)
          ),
          child: const Center(child: Text('Iniciar partida', style: TextStyle(fontFamily: 'sf-pro-display', fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),))),
    );
  }
}
