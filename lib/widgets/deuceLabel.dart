import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:padel_record/provider/puntosProvider.dart';
import 'package:provider/provider.dart';

class DeuceLabel extends StatelessWidget {
  const DeuceLabel({super.key});

  @override
  Widget build(BuildContext context) {

    final puntosProvider = Provider.of<PuntosProvider>(context);

    return Center(
      child: Visibility(
        visible: puntosProvider.empate ? true:false,
        child: Transform.rotate(
          angle: 125,
          child: Container(
            height: 50,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      color: Colors.grey.shade500
                  )
                ]
            ),
            child: const Center(child: Text('Empate', style: TextStyle(fontFamily: 'sf-pro-display', fontSize: 20, color: Colors.amberAccent, fontWeight: FontWeight.bold))),
          ),
        ),
      ),
    );
  }
}
