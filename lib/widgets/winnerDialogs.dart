import 'package:flutter/material.dart';
import 'package:padel_record/provider/winnerProvider.dart';
import 'package:provider/provider.dart';
import '../provider/btnProvider.dart';
import '../provider/playerProvider.dart';
import '../provider/puntosProvider.dart';

class WinnerDialogs {

  void teamAWinnerFixed (context){

    final puntosProvider = Provider.of<PuntosProvider>(context, listen: false);
    final playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    final btnProvider = Provider.of<BtnProvider>(context, listen: false);
    final winnerProvider = Provider.of<WinnerProvider>(context, listen: false);

    if(puntosProvider.set == 1 && (puntosProvider.count1==2 && puntosProvider.count2==3)){
      puntosProvider.deuce();
    }

    if (puntosProvider.empate == true && puntosProvider.count1 == 3){
      puntosProvider.deuce();
      puntosProvider.advA();
      return;
    }

    if (puntosProvider.set == 1 && puntosProvider.count1 == 3){

      winnerProvider.addWinner(playerProvider.playersTeamA[0], playerProvider.playersTeamA[1], puntosProvider.set);
      puntosProvider.startConfetti();
      showDialog(context: context, barrierDismissible: false, builder: (context){
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: SizedBox(
            height: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(height: 180, 'assets/trophy.png'),
                const SizedBox(height: 20,),
                const Text('¡Equipo A Ganador!', style: TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('${playerProvider.playersTeamA[0]}', style: const TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),),
                    Text('${playerProvider.playersTeamA[1]}', style: const TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: (){
                puntosProvider.refresh();
                puntosProvider.advA();
                puntosProvider.stopConfetti();
                Navigator.pop(context);
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
                      Text('Siguiente partida', style: TextStyle(fontFamily: 'sf-pro-display', fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),),
                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 20,)
                    ],
                  )),
            ),
          ],
        );
      });
    } else if (puntosProvider.set == 2 && puntosProvider.count1 == 7){

      winnerProvider.addWinner(playerProvider.playersTeamA[0], playerProvider.playersTeamA[1], puntosProvider.set);
      puntosProvider.startConfetti();
      showDialog(context: context, barrierDismissible: false, builder: (context){
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: SizedBox(
            height: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(height: 180, 'assets/trophy.png'),
                const SizedBox(height: 20,),
                const Text('¡Equipo A Ganador!', style: TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('${playerProvider.playersTeamA[0]}', style: const TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),),
                    Text('${playerProvider.playersTeamA[1]}', style: const TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: (){
                puntosProvider.refresh();
                puntosProvider.stopConfetti();
                Navigator.pop(context);
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
                      Text('Siguiente partida', style: TextStyle(fontFamily: 'sf-pro-display', fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),),
                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 20,)
                    ],
                  )),
            ),
          ],
        );
      });
    } else if (puntosProvider.set == 3 && puntosProvider.count1 == 11){

      winnerProvider.addWinner(playerProvider.playersTeamA[0], playerProvider.playersTeamA[1], puntosProvider.set);
      puntosProvider.startConfetti();
      showDialog(context: context, barrierDismissible: false, builder: (context){
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: SizedBox(
            height: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(height: 180, 'assets/trophy.png'),
                const SizedBox(height: 20,),
                const Text('¡Equipo A Ganador!', style: TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('${playerProvider.playersTeamA[0]}', style: const TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),),
                    Text('${playerProvider.playersTeamA[1]}', style: const TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: (){
                puntosProvider.refresh();
                puntosProvider.stopConfetti();
                Navigator.pop(context);
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
                      Text('Siguiente partida', style: TextStyle(fontFamily: 'sf-pro-display', fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),),
                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 20,)
                    ],
                  )),
            ),
          ],
        );
      });
    }

    print(puntosProvider.count1);
    puntosProvider.sets1(puntosProvider.count1);
    puntosProvider.setsByTeam();
    puntosProvider.addScoreA();
  }

  void teamBWinnerFixed(context){

    final puntosProvider = Provider.of<PuntosProvider>(context, listen: false);
    final playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    final btnProvider = Provider.of<BtnProvider>(context, listen: false);
    final winnerProvider = Provider.of<WinnerProvider>(context, listen: false);

    if(puntosProvider.set == 1 && (puntosProvider.count1==3 && puntosProvider.count2==2)){
      puntosProvider.deuce();
    }

    if (puntosProvider.empate == true && puntosProvider.count2 == 3){
      puntosProvider.deuce();
      puntosProvider.advB();
      return;
    }

    if (puntosProvider.set == 1 && puntosProvider.count2 == 3){

      winnerProvider.addWinner(playerProvider.playersTeamB[0], playerProvider.playersTeamB[1], puntosProvider.set);
      puntosProvider.startConfetti();
      showDialog(context: context, barrierDismissible: false, builder: (context){
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: SizedBox(
            height: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(height: 180, 'assets/trophy.png'),
                const SizedBox(height: 20,),
                const Text('¡Equipo B Ganador!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('${playerProvider.playersTeamB[0]}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),),
                    Text('${playerProvider.playersTeamB[1]}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: (){
                puntosProvider.refresh();
                puntosProvider.advB();
                puntosProvider.stopConfetti();
                Navigator.pop(context);
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
                      Text('Siguiente partida', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),),
                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 20,)
                    ],
                  )),
            ),
          ],
        );
      });
    } else if (puntosProvider.set == 2 && puntosProvider.count2 == 7){

      winnerProvider.addWinner(playerProvider.playersTeamB[0], playerProvider.playersTeamB[1], puntosProvider.set);
      puntosProvider.startConfetti();
      showDialog(context: context, barrierDismissible: false, builder: (context){
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: SizedBox(
            height: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(height: 180, 'assets/trophy.png'),
                const SizedBox(height: 20,),
                const Text('¡Equipo B Ganador!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('${playerProvider.playersTeamB[0]}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),),
                    Text('${playerProvider.playersTeamB[1]}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: (){
                puntosProvider.refresh();
                puntosProvider.stopConfetti();
                Navigator.pop(context);
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
                      Text('Siguiente partida', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),),
                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 20,)
                    ],
                  )),
            ),
          ],
        );
      });
    } else if (puntosProvider.set == 3 && puntosProvider.count2 == 11){

      winnerProvider.addWinner(playerProvider.playersTeamB[0], playerProvider.playersTeamB[1], puntosProvider.set);
      puntosProvider.startConfetti();
      showDialog(context: context, barrierDismissible: false, builder: (context){
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: SizedBox(
            height: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(height: 180, 'assets/trophy.png'),
                const SizedBox(height: 20,),
                const Text('¡Equipo B Ganador!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('${playerProvider.playersTeamB[0]}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),),
                    Text('${playerProvider.playersTeamB[1]}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: (){
                puntosProvider.refresh();
                puntosProvider.stopConfetti();
                Navigator.pop(context);
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
                      Text('Siguiente partida', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),),
                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 20,)
                    ],
                  )),
            ),
          ],
        );
      });
    }

    print(puntosProvider.count2);
    puntosProvider.sets2(puntosProvider.count2);
    puntosProvider.setsByTeam();
    puntosProvider.addScoreB();
  }

  void teamAWinnerRandom(context){

    final puntosProvider = Provider.of<PuntosProvider>(context, listen: false);
    final playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    final btnProvider = Provider.of<BtnProvider>(context, listen: false);
    final winnerProvider = Provider.of<WinnerProvider>(context, listen: false);

    if (puntosProvider.set == 1 && puntosProvider.count1 == 3){

      winnerProvider.addWinner(playerProvider.teamA[0], playerProvider.teamA[1], puntosProvider.set);
      puntosProvider.startConfetti();
      showDialog(context: context, barrierDismissible: false, builder: (context){
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: SizedBox(
            height: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(height: 180, 'assets/trophy.png'),
                const SizedBox(height: 20,),
                const Text('¡Equipo A Ganador!', style: TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('${playerProvider.teamA[0]}', style: const TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),),
                    Text('${playerProvider.teamA[1]}', style: const TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: (){
                puntosProvider.refresh();
                playerProvider.assignTeams();
                puntosProvider.stopConfetti();
                Navigator.pop(context);
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
                      Text('Siguiente partida', style: TextStyle(fontFamily: 'sf-pro-display', fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),),
                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 20,)
                    ],
                  )),
            ),
          ],
        );
      });
    } else if (puntosProvider.set == 2 && puntosProvider.count1 == 7){

      winnerProvider.addWinner(playerProvider.teamA[0], playerProvider.teamA[1], puntosProvider.set);
      puntosProvider.startConfetti();
      showDialog(context: context, barrierDismissible: false, builder: (context){
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: SizedBox(
            height: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(height: 180, 'assets/trophy.png'),
                const SizedBox(height: 20,),
                const Text('¡Equipo A Ganador!', style: TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('${playerProvider.teamA[0]}', style: const TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),),
                    Text('${playerProvider.teamA[1]}', style: const TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: (){
                puntosProvider.refresh();
                playerProvider.assignTeams();
                puntosProvider.stopConfetti();
                Navigator.pop(context);
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
                      Text('Siguiente partida', style: TextStyle(fontFamily: 'sf-pro-display', fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),),
                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 20,)
                    ],
                  )),
            ),
          ],
        );
      });
    } else if (puntosProvider.set == 2 && puntosProvider.count1 == 11){

      winnerProvider.addWinner(playerProvider.teamA[0], playerProvider.teamA[1], puntosProvider.set);
      puntosProvider.startConfetti();
      showDialog(context: context, barrierDismissible: false, builder: (context){
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: SizedBox(
            height: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(height: 180, 'assets/trophy.png'),
                const SizedBox(height: 20,),
                const Text('¡Equipo A Ganador!', style: TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('${playerProvider.teamA[0]}', style: const TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),),
                    Text('${playerProvider.teamA[1]}', style: const TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: (){
                puntosProvider.refresh();
                playerProvider.assignTeams();
                puntosProvider.stopConfetti();
                Navigator.pop(context);
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
                      Text('Siguiente partida', style: TextStyle(fontFamily: 'sf-pro-display', fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),),
                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 20,)
                    ],
                  )),
            ),
          ],
        );
      });
    }

    print(puntosProvider.count1);
    puntosProvider.sets1(puntosProvider.count1);
    puntosProvider.setsByTeam();
    puntosProvider.addScoreA();
  }

  void teamBWinnerRandom(context){

    final puntosProvider = Provider.of<PuntosProvider>(context, listen: false);
    final playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    final btnProvider = Provider.of<BtnProvider>(context, listen: false);
    final winnerProvider = Provider.of<WinnerProvider>(context, listen: false);

    if (puntosProvider.set == 1 && puntosProvider.count2 == 3){

      winnerProvider.addWinner(playerProvider.teamB[0], playerProvider.teamB[1], puntosProvider.set);
      puntosProvider.startConfetti();
      showDialog(context: context, barrierDismissible: false, builder: (context){
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: SizedBox(
            height: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(height: 180, 'assets/trophy.png'),
                const SizedBox(height: 20,),
                const Text('¡Equipo B Ganador!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('${playerProvider.teamB[0]}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),),
                    Text('${playerProvider.teamB[1]}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: (){
                puntosProvider.refresh();
                playerProvider.assignTeams();
                puntosProvider.stopConfetti();
                Navigator.pop(context);
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
                      Text('Siguiente partida', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),),
                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 20,)
                    ],
                  )),
            ),
          ],
        );
      });
    } else if (puntosProvider.set == 2 && puntosProvider.count2 == 7){

      winnerProvider.addWinner(playerProvider.teamB[0], playerProvider.teamB[1], puntosProvider.set);
      puntosProvider.startConfetti();
      showDialog(context: context, barrierDismissible: false, builder: (context){
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: SizedBox(
            height: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(height: 180, 'assets/trophy.png'),
                const SizedBox(height: 20,),
                const Text('¡Equipo B Ganador!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('${playerProvider.teamB[0]}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),),
                    Text('${playerProvider.teamB[1]}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: (){
                puntosProvider.refresh();
                playerProvider.assignTeams();
                puntosProvider.stopConfetti();
                Navigator.pop(context);
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
                      Text('Siguiente partida', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),),
                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 20,)
                    ],
                  )),
            ),
          ],
        );
      });
    } else if (puntosProvider.set == 3 && puntosProvider.count2 == 11){

      winnerProvider.addWinner(playerProvider.teamB[0], playerProvider.teamB[1], puntosProvider.set);
      puntosProvider.startConfetti();
      showDialog(context: context, barrierDismissible: false, builder: (context){
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: SizedBox(
            height: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(height: 180, 'assets/trophy.png'),
                const SizedBox(height: 20,),
                const Text('¡Equipo B Ganador!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('${playerProvider.teamB[0]}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),),
                    Text('${playerProvider.teamB[1]}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: (){
                puntosProvider.refresh();
                playerProvider.assignTeams();
                puntosProvider.stopConfetti();
                Navigator.pop(context);
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
                      Text('Siguiente partida', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),),
                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 20,)
                    ],
                  )),
            ),
          ],
        );
      });
    }

    print(puntosProvider.count2);
    puntosProvider.sets2(puntosProvider.count2);
    puntosProvider.setsByTeam();
    puntosProvider.addScoreB();
  }
}