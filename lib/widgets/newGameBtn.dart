import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/playerProvider.dart';
import '../provider/puntosProvider.dart';

class NewGameBtn extends StatelessWidget {
  const NewGameBtn({super.key});

  @override
  Widget build(BuildContext context) {

    final puntosProvider = Provider.of<PuntosProvider>(context);
    final playerProvider = Provider.of<PlayerProvider>(context);

    return MaterialButton(
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
    );
  }
}
