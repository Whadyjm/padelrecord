import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:padel_record/provider/btnProvider.dart';
import 'package:padel_record/provider/playerProvider.dart';
import 'package:padel_record/provider/puntosProvider.dart';
import 'package:padel_record/widgets/addBtn.dart';
import 'package:padel_record/view/gameFixedTeams.dart';
import 'package:padel_record/view/gameRandomTeams.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {


  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final btnProvider = Provider.of<BtnProvider>(context);

    return btnProvider.fixedTeams
        ? GameFixedTeams()
        : GameRandomTeams();
  }
}