import 'package:flutter/material.dart';
import 'package:padel_record/provider/btnProvider.dart';
import 'package:padel_record/provider/playerProvider.dart';
import 'package:padel_record/provider/puntosProvider.dart';
import 'package:padel_record/view/gameScreen.dart';
import 'package:provider/provider.dart';

class CreateTeamTab extends StatelessWidget {
  const CreateTeamTab({super.key});

  @override
  Widget build(BuildContext context) {

    final playerProvider = Provider.of<PlayerProvider>(context);
    final puntosProvider = Provider.of<PuntosProvider>(context);
    final btnProvider = Provider.of<BtnProvider>(context);
    final TextEditingController nombreControllerA = TextEditingController();
    final TextEditingController nombreControllerB = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            playerProvider.playersTeamA.length == 2
                ? const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Equipo A', style: TextStyle(fontFamily: 'sf-pro-display', color: Colors.blue, fontSize: 25, fontWeight: FontWeight.w800),),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.check_circle, color: Colors.lightGreen, size: 30,),
                ),
              ],)
                : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Equipo A', style: TextStyle(fontFamily: 'sf-pro-display', color: Colors.blue, fontSize: 25, fontWeight: FontWeight.w800),),
                btnProvider.showTextFieldA
                    ? Row(
                  children: [
                    SizedBox(
                        height: 50,
                        width: 200,
                        child: TextField(
                          controller: nombreControllerA,
                          cursorColor: Colors.blue,
                          decoration: const InputDecoration(
                            hintText: 'Ingresa el nombre',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        )
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: IconButton(
                          onPressed: (){
                            if (nombreControllerA.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text('Debes agregar un nombre'),
                                ),
                              );
                            } else if (playerProvider.playersTeamA.length < 2){
                              playerProvider.addPlayersTeamA(nombreControllerA.text);
                              nombreControllerA.clear();
                            } else if (playerProvider.playersTeamA.length == 2){
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text('Equipo completo'),
                                ),
                              );
                            }
                          },
                          icon: const Icon(Icons.add, color: Colors.white,)),
                    ),
                  ],
                )
                    :IconButton(
                    onPressed: (){
                      btnProvider.showTextField1();
                    },
                    icon: Icon(Icons.add, color: Colors.grey.shade700, size: 30,)),
              ],
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: playerProvider.playersTeamA.length,
                itemBuilder: (context, index) {

                  final players = playerProvider.playersTeamA[index];

                  return Column(
                    children: [
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(players.nombre, style: TextStyle(fontFamily:'sf-pro-display', fontWeight: FontWeight.w700, color: Colors.grey.shade700),),
                            TextButton(
                                onPressed: () {
                                  playerProvider.removePlayersTeamA(players);
                                }, child: const Icon(Icons.remove, color: Colors.redAccent, size: 25,))
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const Divider(),
            playerProvider.playersTeamB.length == 2
                ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Equipo B', style: TextStyle(fontFamily: 'sf-pro-display', color: Colors.blue.shade800, fontSize: 25, fontWeight: FontWeight.w800),),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.check_circle, color: Colors.lightGreen, size: 30,),
                ),
              ],)
                :Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Equipo B', style: TextStyle(fontFamily: 'sf-pro-display', color: Colors.blue.shade800, fontSize: 25, fontWeight: FontWeight.w800),),
                btnProvider.showTextFieldB
                    ? Row(
                  children: [
                    SizedBox(
                        height: 50,
                        width: 200,
                        child: TextField(
                          controller: nombreControllerB,
                          cursorColor: Colors.blue,
                          decoration: const InputDecoration(
                            hintText: 'Ingresa el nombre',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        )
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: IconButton(
                          onPressed: (){
                            if (nombreControllerB.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text('Debes agregar un nombre'),
                                ),
                              );
                            } else if (playerProvider.playersTeamB.length < 2){
                              playerProvider.addPlayersTeamB(nombreControllerB.text);
                              nombreControllerB.clear();
                            } else if (playerProvider.playersTeamB.length == 2){
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text('Equipo completo'),
                                ),
                              );
                            }
                          },
                          icon: const Icon(Icons.add, color: Colors.white,)),
                    ),
                  ],
                )
                    : IconButton(
                    onPressed: (){
                      btnProvider.showTextField2();
                    },
                    icon: Icon(Icons.add, color: Colors.grey.shade700, size: 30,)),
              ],
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: playerProvider.playersTeamB.length,
                itemBuilder: (context, index) {

                  final players = playerProvider.playersTeamB[index];

                  return Column(
                    children: [
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(players.nombre, style: TextStyle(fontFamily:'sf-pro-display', fontWeight: FontWeight.w700, color: Colors.grey.shade700),),
                            TextButton(
                                onPressed: () {
                                  playerProvider.removePlayersTeamB(players);
                                }, child: const Icon(Icons.remove, color: Colors.redAccent, size: 25,))
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 50,),
            MaterialButton(
              onPressed: (){

                puntosProvider.refresh();

                if (playerProvider.playersTeamA.length + playerProvider.playersTeamB.length == 4){
                  btnProvider.fixedTeamsGameTrue();
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return GameScreen();
                  }));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text('Se necesitan al menos 4 jugadores'),
                    ),
                  );
                }
              },
              child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: const Center(child: Text('Iniciar partida', style: TextStyle(fontFamily: 'sf-pro-display', fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),))),
            ),
          ],
        ),
      ),
    );
  }
}
