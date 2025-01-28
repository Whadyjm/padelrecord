import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:padel_record/provider/btnProvider.dart';
import 'package:padel_record/provider/playerProvider.dart';
import 'package:padel_record/provider/puntosProvider.dart';
import 'package:padel_record/view/gameScreen.dart';
import 'package:padel_record/widgets/createRandomTeam.dart';
import 'package:padel_record/widgets/createTeamTab.dart';
import 'package:provider/provider.dart';

class PlayerInputScreen extends StatelessWidget {
  const PlayerInputScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(Icons.sports_tennis_rounded, color: Colors.lightGreen, size: 40,),
            )
          ],
          toolbarHeight: 80,
          backgroundColor: Colors.white.withOpacity(0.5),
          //centerTitle: true,
          title: Text('PADEL RECORD', style: TextStyle(fontFamily: 'sf-pro-display', color: Colors.blue.shade800, fontSize: 25, fontWeight: FontWeight.w900),),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              color: Colors.white,
            ),
            tabs: [
              Tab(child: Text('Formar equipos', style: TextStyle(fontFamily: 'sf-pro-display', color: Colors.blue.shade800, fontSize: 15, fontWeight: FontWeight.w800),),),
              Tab(child: Text('Modo aleatorio', style: TextStyle(fontFamily: 'sf-pro-display', color: Colors.blue.shade800, fontSize: 15, fontWeight: FontWeight.w800),),),
            ],
          ),
        ),
        body: const TabBarView(
          children:[
            CreateTeamTab(),
            CreateRandomTeam(),
          ]
        ),
      ),
    );
  }
}