import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/btnProvider.dart';
import '../provider/puntosProvider.dart';

class GameSelector extends StatelessWidget {
  const GameSelector({super.key});

  @override
  Widget build(BuildContext context) {

    final puntosProvider = Provider.of<PuntosProvider>(context);
    final btnProvider = Provider.of<BtnProvider>(context);
    return Padding(
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
              const Text('Juegos', style: TextStyle(fontFamily: 'sf-pro-display', fontWeight: FontWeight.bold, fontSize: 18),),
              const VerticalDivider(thickness: 1,),
              IconButton(onPressed: (){
                puntosProvider.removeSet();
              }, icon: const Icon(Icons.remove)),
              Center(child: Text('${puntosProvider.game}',
                style: TextStyle(fontFamily: 'sf-pro-display', color: btnProvider.darkMode ? Colors.white70:Colors.grey.shade700, fontSize: 20, fontWeight: FontWeight.w700),)),
              IconButton(onPressed: (){
                puntosProvider.addGame();
              }, icon: const Icon(Icons.add)),
            ],
          )),
    );
  }
}
