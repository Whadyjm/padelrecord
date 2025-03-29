import 'dart:math';

import 'package:flutter/material.dart';
import 'package:padel_record/provider/btnProvider.dart';
import 'package:provider/provider.dart';

import '../provider/puntosProvider.dart';

class AddRemoveBtns extends StatelessWidget {
  const AddRemoveBtns({super.key});


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _teamABtn(context),  ///<-- Team A button
          _teamBBtn(context)   ///<-- Team B button
        ],
      ),
    );
  }
}

Widget _teamABtn(context) {

  final puntosProvider = Provider.of<PuntosProvider>(context);

  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12)
    ),
    child: IconButton(
        onPressed: (){
          puntosProvider.addScoreA();
          print('Counter A: ${puntosProvider.counterA}');
        },
        icon: const Icon(Icons.add, color: Colors.white,)),
  );
}

Widget _teamBBtn(context) {

  final puntosProvider = Provider.of<PuntosProvider>(context);

  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12)
    ),
    child: IconButton(
        onPressed: (){
          puntosProvider.addScoreB();
          print('Counter B: ${puntosProvider.counterB}');
        },
        icon: const Icon(Icons.add, color: Colors.white,)),
  );
}