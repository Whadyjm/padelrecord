import 'dart:math';
import 'package:flutter/material.dart';
import 'package:padel_record/provider/btnProvider.dart';
import 'package:padel_record/provider/playerProvider.dart';
import 'package:padel_record/provider/puntosProvider.dart';
import 'package:padel_record/provider/winnerProvider.dart';
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
        }),
        ChangeNotifierProvider(create: (context){
          return PuntosProvider();
        }),
        ChangeNotifierProvider(create: (context){
          return BtnProvider();
        }),
        ChangeNotifierProvider(create: (context){
          return WinnerProvider();
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PlayerInputScreen(),
      ),
    );
  }
}