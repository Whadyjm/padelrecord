import 'package:flutter/material.dart';

class PlayerTextField extends StatelessWidget {
  const PlayerTextField({super.key, required this.nombre});

  final TextEditingController nombre;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: 200,
        child: TextField(
          controller: nombre,
          cursorColor: Colors.blue,
          decoration: const InputDecoration(
            hintText: 'Ingresa el nombre',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        )
    );
  }
}