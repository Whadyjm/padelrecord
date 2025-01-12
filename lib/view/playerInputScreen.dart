import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:padel_record/view/gameScreen.dart';

class PlayerInputScreen extends StatefulWidget {
  const PlayerInputScreen({super.key});

  @override
  _PlayerInputScreenState createState() => _PlayerInputScreenState();
}

class _PlayerInputScreenState extends State<PlayerInputScreen> {
  final List<String> _players = ['whady', 'ale', 'mari', 'emma'];
  final TextEditingController _controller = TextEditingController();

  void _addPlayer() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _players.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _startGame() {
    if (_players.length >= 4) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameScreen(players: _players),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Se necesitan al menos 4 jugadores')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: const Text('Ingresar Jugadores'),
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
                    controller: _controller,
                    decoration: const InputDecoration(labelText: 'Nombre del jugador'),
                  ),
                ),
                const SizedBox(width: 10,),
                MaterialButton(
                  onPressed: (){
                    _addPlayer();
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.lightGreenAccent,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Icon(Icons.add, color: Colors.grey.shade700,)
                  ),
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
                itemCount: _players.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_players[index], style: const TextStyle(fontWeight: FontWeight.w700),),
                        TextButton(
                          onPressed: () {
                          setState(() {
                            _players.remove(_players[index]);
                          });
                        }, child: const Text('-', style: TextStyle(color: Colors.redAccent, fontSize: 40),),)
                      ],
                    ),
                  );
                },
              ),
            ),
            MaterialButton(
              onPressed: (){
                _startGame();
              },
              child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.lightGreenAccent,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Center(child: Text('Iniciar Partida', style: TextStyle(fontSize: 18, color: Colors.grey.shade700, fontWeight: FontWeight.bold),))),
            ),
          ],
        ),
      ),
    );
  }
}