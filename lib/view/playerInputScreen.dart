import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:padel_record/provider/playerProvider.dart';
import 'package:padel_record/provider/puntosProvider.dart';
import 'package:padel_record/view/gameScreen.dart';
import 'package:provider/provider.dart';

class PlayerInputScreen extends StatelessWidget {
  const PlayerInputScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final playerProvider = Provider.of<PlayerProvider>(context);
    final puntosProvider = Provider.of<PuntosProvider>(context);
    final TextEditingController nombreController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        centerTitle: true,
        title: Text('PADEL RECORD', style: TextStyle(fontFamily: 'sf-pro-display', color: Colors.blue.shade800, fontSize: 25, fontWeight: FontWeight.w900),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    maxLength: 12,
                    controller: nombreController,
                    decoration: const InputDecoration(labelText: 'Nombre del jugador'),
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: IconButton(
                          onPressed: (){
                            if (nombreController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text('Debes agregar un nombre'),
                              ),
                            );
                            } else {
                              playerProvider.addPlayer(nombreController.text);
                              nombreController.clear();
                            }
                          },
                          icon: const Icon(Icons.add, color: Colors.white,)),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Jugadores:', style: TextStyle(fontFamily: 'sf-pro-display', fontSize: 16, color: Colors.grey.shade800, fontWeight: FontWeight.w700),),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: playerProvider.players.length,
                itemBuilder: (context, index) {

                  final player = playerProvider.players[index];

                  return Column(
                    children: [
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(player.nombre, style: TextStyle(fontFamily:'sf-pro-display', fontWeight: FontWeight.w700, color: Colors.grey.shade700),),
                            TextButton(
                              onPressed: () {
                              playerProvider.removePlayer(player);
                            }, child: const Icon(Icons.remove, color: Colors.redAccent, size: 25,))
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            MaterialButton(
              onPressed: (){

                puntosProvider.refresh();
                
                if (playerProvider.players.length >= 4){
                  playerProvider.assignTeams();
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