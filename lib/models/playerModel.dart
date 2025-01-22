import 'package:flutter/cupertino.dart';

class PlayerModel with ChangeNotifier{

  final String nombre;
  final int puntos;

  @override
  String toString() {
    return nombre; /// Sobrescribe el nombre para que no muestre 'instance of PlayerModel'
  }

  PlayerModel({
    required this.nombre,
    this.puntos = 0
});

}