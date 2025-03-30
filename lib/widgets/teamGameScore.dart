import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/btnProvider.dart';
import '../provider/puntosProvider.dart';

class TeamGameScore extends StatelessWidget {
  const TeamGameScore({super.key});

  @override
  Widget build(BuildContext context) {

    final puntosProvider = Provider.of<PuntosProvider>(context);
    final btnProvider = Provider.of<BtnProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Visibility(
                  visible: puntosProvider.firstGameTeamA ? true:false,
                  child: Text('1er Juego', style: TextStyle(fontFamily: 'sf-pro-display', fontWeight: FontWeight.w600, color: btnProvider.darkMode ? Colors.white70:Colors.grey.shade700),)),
              const SizedBox(height: 10,),
              Visibility(
                  visible: puntosProvider.secondGameTeamA ? true:false,
                  child: Text('2do Juego', style: TextStyle(fontFamily: 'sf-pro-display', fontWeight: FontWeight.w600, color: btnProvider.darkMode ? Colors.white70:Colors.grey.shade700),)),
              const SizedBox(height: 10,),
              Visibility(
                  visible: puntosProvider.thirdGame1 ? true:false,
                  child: Text('3er Juego', style: TextStyle(fontFamily: 'sf-pro-display', fontWeight: FontWeight.w600, color: btnProvider.darkMode ? Colors.white70:Colors.grey.shade700),)),
            ],
          ),
          Column(
            children: [
              Visibility(
                  visible: puntosProvider.firstGameTeamB ? true:false,
                  child: Text('1er Juego', style: TextStyle(fontFamily: 'sf-pro-display', fontWeight: FontWeight.w600, color: btnProvider.darkMode ? Colors.white70:Colors.grey.shade700),)),
              const SizedBox(height: 10,),
              Visibility(
                  visible: puntosProvider.secondGameTeamB ? true:false,
                  child: Text('2do Juego', style: TextStyle(fontFamily: 'sf-pro-display', fontWeight: FontWeight.w600, color: btnProvider.darkMode ? Colors.white70:Colors.grey.shade700),)),
              const SizedBox(height: 10,),
              Visibility(
                  visible: puntosProvider.thirdGame2 ? true:false,
                  child: Text('3er Juego', style: TextStyle(fontFamily: 'sf-pro-display', fontWeight: FontWeight.w600, color: btnProvider.darkMode ? Colors.white70:Colors.grey.shade700),)),
            ],
          ),
        ],
      ),
    );
  }
}
