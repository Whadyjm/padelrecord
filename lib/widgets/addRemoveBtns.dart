import 'package:flutter/material.dart';
import 'package:padel_record/provider/puntosProvider.dart';
import 'package:provider/provider.dart';

class AddRemoveBtns extends StatelessWidget {
  const AddRemoveBtns({super.key});

  @override
  Widget build(BuildContext context) {

    final puntosProvider = Provider.of<PuntosProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){
            puntosProvider.backScoreA();
          }, icon: const Icon(Icons.remove)),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12)
            ),
            child: IconButton(
                onPressed: (){

                  if (puntosProvider.set == 1 && puntosProvider.count1 == 4){
                    return;
                  } else if (puntosProvider.set == 2 && puntosProvider.count1 == 8){
                    return;
                  } else if (puntosProvider.set == 2 && puntosProvider.count1 == 12){
                    return;
                  }

                  puntosProvider.sets1(puntosProvider.count1);
                  puntosProvider.addScoreA();
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
                  if (puntosProvider.set == 1 && puntosProvider.count2 == 4){
                    return;
                  } else if (puntosProvider.set == 2 && puntosProvider.count2 == 8){
                    return;
                  } else if (puntosProvider.set == 2 && puntosProvider.count2 == 12){
                    return;
                  }

                  puntosProvider.sets2(puntosProvider.count2);

                  puntosProvider.addScoreB();
                },
                icon: const Icon(Icons.add, color: Colors.white,)),
          ),
          IconButton(onPressed: (){
            puntosProvider.backScoreB();
          }, icon: const Icon(Icons.remove)),
        ],
      ),
    );
  }
}
