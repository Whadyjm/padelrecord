import 'package:flutter/material.dart';
import 'package:padel_record/provider/btnProvider.dart';
import 'package:padel_record/provider/playerProvider.dart';
import 'package:padel_record/provider/puntosProvider.dart';
import 'package:padel_record/view/gameScreen.dart';
import 'package:padel_record/widgets/playerTextField.dart';
import 'package:padel_record/widgets/startGameBtn.dart';
import 'package:provider/provider.dart';

import '../provider/winnerProvider.dart';

class CreateTeamTab extends StatelessWidget {
  const CreateTeamTab({super.key});

  @override
  Widget build(BuildContext context) {

    final playerProvider = Provider.of<PlayerProvider>(context);
    final puntosProvider = Provider.of<PuntosProvider>(context);
    final btnProvider = Provider.of<BtnProvider>(context);
    final winnerProvider = Provider.of<WinnerProvider>(context);

    final TextEditingController nombreControllerA = TextEditingController();
    final TextEditingController nombreControllerB = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            playerProvider.playersTeamA.length == 2     ///si el equipo A tiene 2 jugadores
                ? const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Equipo A', style: TextStyle(fontFamily: 'sf-pro-display', color: Colors.blue, fontSize: 25, fontWeight: FontWeight.w800),),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.check_circle, color: Colors.lightGreen, size: 30,),
                ),
                ///
                ///
              ],)
                : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Equipo A', style: TextStyle(fontFamily: 'sf-pro-display', color: Colors.blue, fontSize: 25, fontWeight: FontWeight.w800),),
                btnProvider.showTextFieldA
                    ? Row(
                  children: [
                    PlayerTextField(nombre: nombreControllerA,),
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
                              snackbar1(context);
                            } else if (nombreControllerA.text.length > 6){
                              snackbar2(context);
                            } else if (playerProvider.playersTeamA.length < 2){
                              playerProvider.addPlayersTeamA(nombreControllerA.text.trim());
                              nombreControllerA.clear();
                            } else if (playerProvider.playersTeamA.length == 2){
                              snackbar3(context);
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
                            Text(players.nombre, style: TextStyle(fontFamily:'sf-pro-display', fontWeight: FontWeight.w700, color: btnProvider.darkMode ? Colors.white70:Colors.grey.shade700,),),
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
                if (btnProvider.showTextFieldB) Row(
                  children: [
                    PlayerTextField(nombre: nombreControllerB,),
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
                              snackbar1(context);
                            } else if (nombreControllerB.text.length > 6){
                              snackbar2(context);
                            } else if (playerProvider.playersTeamB.length < 2){
                              playerProvider.addPlayersTeamB(nombreControllerB.text);
                              nombreControllerB.clear();
                            } else if (playerProvider.playersTeamB.length == 2){
                              snackbar3(context);
                            }
                          },
                          icon: const Icon(Icons.add, color: Colors.white,)),
                    ),
                  ],
                ) else IconButton(
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
                            Text(players.nombre, style: TextStyle(fontFamily:'sf-pro-display', fontWeight: FontWeight.w700, color: btnProvider.darkMode ? Colors.white70:Colors.grey.shade700,),),
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
            const StartGameBtn(),
          ],
        ),
      ),
    );
  }

  void snackbar3(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 1),
        content: Text('Equipo completo'),
      ),
    );
  }

  void snackbar2(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 1),
        content: Text('El nombre no debe superar los 6 caracteres'),
      ),
    );
  }

  void snackbar1(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 1),
        content: Text('Debes agregar un nombre'),
      ),
    );
  }
}

