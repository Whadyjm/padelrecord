import 'dart:math';
import 'package:flutter/material.dart';
import 'package:padel_record/provider/playerProvider.dart';
import 'package:padel_record/view/playerInputScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const PadelApp());
}

class PadelApp extends StatelessWidget {
  const PadelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context){
          return PlayerProvider();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Partida de Padel',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PlayerInputScreen(),
      ),
    );
  }
}