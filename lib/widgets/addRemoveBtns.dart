import 'package:flutter/material.dart';
import 'package:padel_record/provider/btnProvider.dart';
import 'package:padel_record/provider/puntosProvider.dart';
import 'package:padel_record/widgets/winnerDialogs.dart';
import 'package:provider/provider.dart';

class AddRemoveBtns extends StatelessWidget {
  const AddRemoveBtns({super.key});


  @override
  Widget build(BuildContext context) {

    final puntosProvider = Provider.of<PuntosProvider>(context);
    final btnProvider = Provider.of<BtnProvider>(context);

    return btnProvider.fixedTeams
        ? Padding(
      padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // IconButton(onPressed: (){
          //   puntosProvider.backScoreA();
          // }, icon: const Icon(Icons.remove)),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12)
            ),
            child: IconButton(
                onPressed: (){
                  WinnerDialogs().teamAWinnerFixed(context);
                },
                icon: const Icon(Icons.add, color: Colors.white,)),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12)
            ),
            child: IconButton(
                onPressed: (){
                  WinnerDialogs().teamBWinnerFixed(context);
                },
                icon: const Icon(Icons.add, color: Colors.white,)),
          ),
          // IconButton(onPressed: (){
          //   puntosProvider.backScoreB();
          // }, icon: const Icon(Icons.remove)),
        ],
      ),
    )
        : Padding(
      padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // IconButton(onPressed: (){
          //   puntosProvider.backScoreA();
          // }, icon: const Icon(Icons.remove)),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12)
            ),
            child: IconButton(
                onPressed: (){
                  WinnerDialogs().teamAWinnerRandom(context);
                },
                icon: const Icon(Icons.add, color: Colors.white,)),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12)
            ),
            child: IconButton(
                onPressed: (){
                  WinnerDialogs().teamBWinnerRandom(context);
                },
                icon: const Icon(Icons.add, color: Colors.white,)),
          ),
          // IconButton(onPressed: (){
          //   puntosProvider.backScoreB();
          // }, icon: const Icon(Icons.remove)),
        ],
      ),
    );
  }
}
