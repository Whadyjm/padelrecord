import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/btnProvider.dart';
import '../provider/playerProvider.dart';
import '../provider/puntosProvider.dart';

class GameScore extends StatelessWidget {
  const GameScore({super.key});

  @override
  Widget build(BuildContext context) {

    final puntosProvider = Provider.of<PuntosProvider>(context);
    final playerProvider = Provider.of<PlayerProvider>(context);
    final btnProvider = Provider.of<BtnProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white.withOpacity(0.3),
          ),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white.withOpacity(0.3),
                ),
                child: const Center(child: Text('A', style: TextStyle(fontFamily: 'sf-pro-display', fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold))),
              ),
              const SizedBox(width: 5,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(playerProvider.playersTeamA[0].toString(), style: const TextStyle(fontFamily: 'sf-pro-display', fontSize: 15, color: Colors.black87, fontWeight: FontWeight.bold),),
                  Text(playerProvider.playersTeamA[1].toString(), style: const TextStyle(fontFamily: 'sf-pro-display', fontSize: 15, color: Colors.black87, fontWeight: FontWeight.bold),),
                ],
              ),
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
            child: Center(child: Text('${puntosProvider.advA ? 'Adv':puntosProvider.scoreA}',
              style: const TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 25),))),
        Text('VS', style: TextStyle(fontFamily: 'sf-pro-display', fontWeight: FontWeight.w900, fontSize: 20, color: btnProvider.darkMode ? Colors.white:Colors.grey.shade800,),),
        Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
            ),
            child: Center(child: Text('${puntosProvider.advB ? 'Adv':puntosProvider.scoreB}',
              style: const TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontWeight: FontWeight.w700, fontSize: 25),))),
        Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white.withOpacity(0.3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 5,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(playerProvider.playersTeamB[0].toString(), style: const TextStyle(fontFamily: 'sf-pro-display', fontSize: 15, color: Colors.black87, fontWeight: FontWeight.bold),),
                  Text(playerProvider.playersTeamB[1].toString(), style: const TextStyle(fontFamily: 'sf-pro-display', fontSize: 15, color: Colors.black87, fontWeight: FontWeight.bold),),
                ],
              ),
              Container(
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white.withOpacity(0.3),
                ),
                child: const Center(child: Text('B', style: TextStyle(fontFamily: 'sf-pro-display', fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold))),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
