import 'package:flutter/material.dart';
import 'package:padel_record/provider/playerProvider.dart';
import 'package:padel_record/provider/puntosProvider.dart';
import 'package:provider/provider.dart';

class AddRemoveBtns extends StatelessWidget {
  const AddRemoveBtns({super.key});

  @override
  Widget build(BuildContext context) {

    final puntosProvider = Provider.of<PuntosProvider>(context);
    final playerProvider = Provider.of<PlayerProvider>(context);

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

                  if (puntosProvider.set == 1 && puntosProvider.count1 == 3){
                    showDialog(context: context, barrierDismissible: false, builder: (context){
                      return AlertDialog(
                        backgroundColor: Colors.transparent,
                        content: SizedBox(
                          height: 280,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(height: 180, 'assets/trophy.png'),
                              const SizedBox(height: 20,),
                              const Text('¡Equipo A Ganador!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('${playerProvider.teamA[0]}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),),
                                  Text('${playerProvider.teamA[1]}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          MaterialButton(
                            onPressed: (){
                              puntosProvider.refresh();
                              playerProvider.assignTeams();

                              Navigator.pop(context);
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
                                    Text('Siguiente partida', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),),
                                    Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 20,)
                                  ],
                                )),
                          ),
                        ],
                      );
                    });
                  } else if (puntosProvider.set == 2 && puntosProvider.count1 == 8){
                    return;
                  } else if (puntosProvider.set == 2 && puntosProvider.count1 == 12){
                    return;
                  }

                  print(puntosProvider.count1);
                  puntosProvider.sets1(puntosProvider.count1);
                  puntosProvider.setsByTeam();
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
                  if (puntosProvider.set == 1 && puntosProvider.count2 == 3){
                    showDialog(context: context, barrierDismissible: false, builder: (context){
                      return AlertDialog(
                        backgroundColor: Colors.transparent,
                        content: SizedBox(
                          height: 280,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(height: 180, 'assets/trophy.png'),
                              const SizedBox(height: 20,),
                              const Text('¡Equipo B Ganador!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('${playerProvider.teamB[0]}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),),
                                  Text('${playerProvider.teamB[1]}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          MaterialButton(
                            onPressed: (){
                              puntosProvider.refresh();
                              playerProvider.assignTeams();

                              Navigator.pop(context);
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
                                    Text('Siguiente partida', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),),
                                    Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 20,)
                                  ],
                                )),
                          ),
                        ],
                      );
                    });
                  } else if (puntosProvider.set == 2 && puntosProvider.count2 == 8){
                    return;
                  } else if (puntosProvider.set == 2 && puntosProvider.count2 == 12){
                    return;
                  }

                  print(puntosProvider.count2);
                  puntosProvider.sets2(puntosProvider.count2);
                  puntosProvider.setsByTeam();
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
