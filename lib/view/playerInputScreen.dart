import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:padel_record/models/playerModel.dart';
import 'package:padel_record/provider/playerProvider.dart';
import 'package:padel_record/view/gameScreen.dart';
import 'package:provider/provider.dart';

class PlayerInputScreen extends StatelessWidget {
  const PlayerInputScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final playerProvider = Provider.of<PlayerProvider>(context);
    final TextEditingController nombreController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: const Text('Ingresar jugadores'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: nombreController,
                    decoration: const InputDecoration(labelText: 'Nombre del jugador'),
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: IconButton(
                          onPressed: (){
                            if (nombreController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Debes agregar un nombre'),
                              ),
                            );
                            } else {
                              playerProvider.addPlayer(nombreController.text);
                              nombreController.clear();
                            }
                          },
                          icon: Icon(Icons.add, color: Colors.grey.shade700,)),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Jugadores:', style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.bold),),
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
                            Text(player.nombre, style: const TextStyle(fontWeight: FontWeight.w700),),
                            TextButton(
                              onPressed: () {
                              playerProvider.removePlayer(player);
                            }, child: const Text('-', style: TextStyle(color: Colors.redAccent, fontSize: 40),),)
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
                if (playerProvider.players.length >= 4){
                  playerProvider.assignTeams();
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return GameScreen();
                  }));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Se necesitan al menos 4 jugadores'),
                    ),
                  );
                }
              },
              child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.lightGreenAccent,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(child: Text('Iniciar partida', style: TextStyle(fontSize: 18, color: Colors.grey.shade700, fontWeight: FontWeight.bold),))),
            ),
          ],
        ),
      ),
    );
  }
}