import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/btnProvider.dart';
import '../provider/winnerProvider.dart';

class GameList extends StatelessWidget {
  const GameList({super.key});

  @override
  Widget build(BuildContext context) {

    final winnerProvider = Provider.of<WinnerProvider>(context);
    final btnProvider = Provider.of<BtnProvider>(context);

    return Expanded(
        child: ListView.builder(
            itemCount: winnerProvider.winner.length,
            itemBuilder: (context, index){

              final winner = winnerProvider.winner[index];

              return ListTile(
                leading: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade700,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: const Icon(Icons.grade_rounded, color: Colors.amber, size: 30,)),
                title: Row(
                  children: [
                    Text('Equipo: ', style: TextStyle(fontFamily: 'sf-pro-display', fontWeight: FontWeight.w500, color: btnProvider.darkMode ? Colors.white70:Colors.grey.shade700)),
                    Text('${winner.player1.toUpperCase()} - ${winner.player2.toUpperCase()}', style: TextStyle(fontFamily: 'sf-pro-display', fontWeight: FontWeight.w700, color: btnProvider.darkMode ? Colors.white70:Colors.grey.shade700)),
                  ],
                ),
                subtitle: Text('Juegos: ${winner.sets}', style: TextStyle(fontFamily: 'sf-pro-display', fontWeight: FontWeight.w600,  color: btnProvider.darkMode ? Colors.white70:Colors.grey.shade700)),
              );
            }
        )
    );
  }
}
