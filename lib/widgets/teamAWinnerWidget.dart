import 'package:flutter/material.dart';

import '../provider/playerProvider.dart';
import 'nextGameBtn.dart';

class TeamAWinnerWidget extends StatelessWidget {
  const TeamAWinnerWidget({
    super.key,
    required this.playerProvider,
  });

  final PlayerProvider playerProvider;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: SizedBox(
        height: 280,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(height: 180, 'assets/trophy.png'),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '¡Equipo A Ganador!',
              style: TextStyle(
                  fontFamily: 'sf-pro-display',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${playerProvider.playersTeamA[0]}',
                  style: const TextStyle(
                      fontFamily: 'sf-pro-display',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                Text(
                  '${playerProvider.playersTeamA[1]}',
                  style: const TextStyle(
                      fontFamily: 'sf-pro-display',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: const [
        NextGameBtn(),
      ],
    );
  }
}