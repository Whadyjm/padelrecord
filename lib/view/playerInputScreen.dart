import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:padel_record/provider/btnProvider.dart';
import 'package:padel_record/widgets/config.dart';
import 'package:padel_record/widgets/createRandomTeam.dart';
import 'package:padel_record/widgets/createTeamTab.dart';
import 'package:provider/provider.dart';

class PlayerInputScreen extends StatelessWidget {
  const PlayerInputScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final btnProvider = Provider.of<BtnProvider>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: btnProvider.darkMode ? Colors.grey.shade900:Colors.grey.shade300,
        ///
        ///Configura modo de juego y modo claro - oscuro
        ///
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            showDialog(context: context, builder: (context){
              return Config();
            });
          }, icon: Icon(Icons.menu_rounded, color: Colors.grey.shade700,)),
          ///
          actions: const [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(Icons.sports_tennis_rounded, color: Colors.lightGreen, size: 40,),
            )
          ],
          toolbarHeight: 80,
          backgroundColor: Colors.white.withOpacity(0.5),
          //centerTitle: true,
          title: Text('PADEL RECORD', style: TextStyle(fontFamily: 'sf-pro-display', color: btnProvider.darkMode ? Colors.white70:Colors.blue.shade800, fontSize: 25, fontWeight: FontWeight.w900),),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              color: btnProvider.darkMode ? Colors.white38:Colors.grey.shade300,
            ),
            tabs: [
              Tab(child: Text('Formar equipos', style: TextStyle(fontFamily: 'sf-pro-display', color: btnProvider.darkMode ? Colors.white:Colors.blue.shade800, fontSize: 15, fontWeight: FontWeight.w800),),),
              Tab(child: Text('Modo aleatorio', style: TextStyle(fontFamily: 'sf-pro-display', color: btnProvider.darkMode ? Colors.white:Colors.blue.shade800, fontSize: 15, fontWeight: FontWeight.w800),),),
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