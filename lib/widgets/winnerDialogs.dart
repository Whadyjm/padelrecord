import 'package:flutter/material.dart';
import 'package:padel_record/provider/winnerProvider.dart';
import 'package:padel_record/widgets/teamAWinnerWidget.dart';
import 'package:padel_record/widgets/teamBWidgetWinner.dart';
import 'package:provider/provider.dart';
import '../provider/btnProvider.dart';
import '../provider/playerProvider.dart';
import '../provider/puntosProvider.dart';

class WinnerDialogs {
  void teamAWinnerFixed(context) {
    final puntosProvider = Provider.of<PuntosProvider>(context, listen: false);
    final playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    final winnerProvider = Provider.of<WinnerProvider>(context, listen: false);

    ///empatan ambos equipos
    if ((puntosProvider.count1 == 2 && puntosProvider.count2 == 3)) {
      puntosProvider.deuce();
    }
    ///da ventaja a team A luego de empatar
    if (puntosProvider.empate == true && puntosProvider.count1 == 3) {
      puntosProvider.deuce();
      puntosProvider.advA();
      return;
    }
    ///regresa al empate luego de que team B estaba en ventaja
    if (puntosProvider.adv2 == true && puntosProvider.count1 == 3) {
      puntosProvider.advB();
      puntosProvider.deuce();
      return;
    }

    if ((puntosProvider.game == 1 && puntosProvider.count1 == 3)) {

      winnerProvider.addWinner(playerProvider.playersTeamA[0],
          playerProvider.playersTeamA[1], puntosProvider.game);
      puntosProvider.startConfetti();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return TeamAWinnerWidget(playerProvider: playerProvider);
          });
    } else if (puntosProvider.game == 2 && puntosProvider.count1 == 7) {
      puntosProvider.refresh();

      winnerProvider.addWinner(playerProvider.playersTeamA[0],
          playerProvider.playersTeamA[1], puntosProvider.game);
      puntosProvider.startConfetti();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return TeamAWinnerWidget(playerProvider: playerProvider);
          });
    } else if (puntosProvider.game == 3 && puntosProvider.count1 == 11) {
      winnerProvider.addWinner(playerProvider.playersTeamA[0],
          playerProvider.playersTeamA[1], puntosProvider.game);
      puntosProvider.startConfetti();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return TeamAWinnerWidget(playerProvider: playerProvider);
          });
    }

    print('count1: ${puntosProvider.count1}');
    puntosProvider.sets1(puntosProvider.count1);
    puntosProvider.setsByTeam();
    puntosProvider.addScoreA();
  }

  void teamBWinnerFixed(context) {
    final puntosProvider = Provider.of<PuntosProvider>(context, listen: false);
    final playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    final winnerProvider = Provider.of<WinnerProvider>(context, listen: false);

    if (puntosProvider.adv1 == true && puntosProvider.count2 == 3) {
      puntosProvider.advA();
      puntosProvider.deuce();
      return;
    }

    if (puntosProvider.game == 1 &&
        (puntosProvider.count1 == 3 && puntosProvider.count2 == 2)) {
      puntosProvider.deuce();
    }

    if (puntosProvider.empate == true && puntosProvider.count2 == 3) {
      puntosProvider.deuce();
      puntosProvider.advB();
      return;
    }

    if (puntosProvider.adv1 == true && puntosProvider.count2 == 4) {
      puntosProvider.advA();
    }

    if (puntosProvider.game == 1 && puntosProvider.count2 == 3) {
      if (puntosProvider.game == 1 &&
          puntosProvider.count2 == 3 &&
          puntosProvider.count1 == 3) {
        puntosProvider.advB();
      }

      winnerProvider.addWinner(playerProvider.playersTeamB[0],
          playerProvider.playersTeamB[1], puntosProvider.game);
      puntosProvider.startConfetti();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return TeamBWinnerWidget(playerProvider: playerProvider);
          });
    } else if (puntosProvider.game == 2 && puntosProvider.count2 == 7) {
      puntosProvider.refresh();

      winnerProvider.addWinner(playerProvider.playersTeamB[0],
          playerProvider.playersTeamB[1], puntosProvider.game);
      puntosProvider.startConfetti();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return TeamBWinnerWidget(playerProvider: playerProvider);
          });
    } else if (puntosProvider.game == 3 && puntosProvider.count2 == 11) {
      winnerProvider.addWinner(playerProvider.playersTeamB[0],
          playerProvider.playersTeamB[1], puntosProvider.game);
      puntosProvider.startConfetti();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return TeamBWinnerWidget(playerProvider: playerProvider);
          });
    }

    print('count2: ${puntosProvider.count2}');
    puntosProvider.sets2(puntosProvider.count2);
    puntosProvider.setsByTeam();
    puntosProvider.addScoreB();
  }

  void teamAWinnerRandom(context) {
    final puntosProvider = Provider.of<PuntosProvider>(context, listen: false);
    final playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    final btnProvider = Provider.of<BtnProvider>(context, listen: false);
    final winnerProvider = Provider.of<WinnerProvider>(context, listen: false);

    if (puntosProvider.game == 1 && puntosProvider.count1 == 3) {
      winnerProvider.addWinner(
          playerProvider.teamA[0], playerProvider.teamA[1], puntosProvider.game);
      puntosProvider.startConfetti();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return TeamAWinnerWidget(playerProvider: playerProvider);
          });
    } else if (puntosProvider.game == 2 && puntosProvider.count1 == 7) {
      winnerProvider.addWinner(
          playerProvider.teamA[0], playerProvider.teamA[1], puntosProvider.game);
      puntosProvider.startConfetti();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return TeamAWinnerWidget(playerProvider: playerProvider);
          });
    } else if (puntosProvider.game == 2 && puntosProvider.count1 == 11) {
      winnerProvider.addWinner(
          playerProvider.teamA[0], playerProvider.teamA[1], puntosProvider.game);
      puntosProvider.startConfetti();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return TeamAWinnerWidget(playerProvider: playerProvider);
          });
    }

    print(puntosProvider.count1);
    puntosProvider.sets1(puntosProvider.count1);
    puntosProvider.setsByTeam();
    puntosProvider.addScoreA();
  }

  void teamBWinnerRandom(context) {
    final puntosProvider = Provider.of<PuntosProvider>(context, listen: false);
    final playerProvider = Provider.of<PlayerProvider>(context, listen: false);
    final winnerProvider = Provider.of<WinnerProvider>(context, listen: false);

    if (puntosProvider.game == 1 && puntosProvider.count2 == 3) {
      winnerProvider.addWinner(
          playerProvider.teamB[0], playerProvider.teamB[1], puntosProvider.game);
      puntosProvider.startConfetti();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return TeamBWinnerWidget(playerProvider: playerProvider);
          });
    } else if (puntosProvider.game == 2 && puntosProvider.count2 == 7) {
      winnerProvider.addWinner(
          playerProvider.teamB[0], playerProvider.teamB[1], puntosProvider.game);
      puntosProvider.startConfetti();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return TeamBWinnerWidget(playerProvider: playerProvider);
          });
    } else if (puntosProvider.game == 3 && puntosProvider.count2 == 11) {
      winnerProvider.addWinner(
          playerProvider.teamB[0], playerProvider.teamB[1], puntosProvider.game);
      puntosProvider.startConfetti();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return TeamBWinnerWidget(playerProvider: playerProvider);
          });
    }

    print(puntosProvider.count2);
    puntosProvider.sets2(puntosProvider.count2);
    puntosProvider.setsByTeam();
    puntosProvider.addScoreB();
  }
}
