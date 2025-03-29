import 'package:flutter/material.dart';

import '../provider/playerProvider.dart';
import 'nextGameBtn.dart';

class TeamBWinnerWidget extends StatelessWidget {
  const TeamBWinnerWidget({
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
              '¡Equipo B Ganador!',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${playerProvider.playersTeamB[0]}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
                Text(
                  '${playerProvider.playersTeamB[1]}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
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