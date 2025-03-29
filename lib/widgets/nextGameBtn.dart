import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/puntosProvider.dart';

class NextGameBtn extends StatelessWidget {
  const NextGameBtn({super.key});

  @override
  Widget build(BuildContext context) {

    final puntosProvider = Provider.of<PuntosProvider>(context, listen: false);

    return MaterialButton(
      onPressed: (){
        puntosProvider.refresh();
        puntosProvider.stopConfetti();
        Navigator.pop(context);
      },
      child: Container(
          height: 40,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.blue.shade400,
              borderRadius: BorderRadius.circular(12)
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Siguiente partida', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),),
              Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 20,)
            ],
          )),
    );
  }
}
