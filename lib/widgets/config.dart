import 'package:flutter/material.dart';
import 'package:padel_record/provider/btnProvider.dart';
import 'package:padel_record/widgets/configBtn.dart';
import 'package:provider/provider.dart';

class Config extends StatelessWidget {
  const Config({super.key});

  @override
  Widget build(BuildContext context) {

    final btnProvider = Provider.of<BtnProvider>(context);

    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(btnProvider.darkMode ? 'Modo dia':'Modo nocturno', style: TextStyle(fontFamily: 'sf-pro-display', color: Colors.blue.shade800, fontSize: 18, fontWeight: FontWeight.w700),),
                IconButton(onPressed: (){
                  btnProvider.switchDarkMode();
                  Navigator.pop(context);
                }, icon: btnProvider.darkMode ? const Icon(Icons.sunny, color: Colors.amber,):Icon(Icons.dark_mode_rounded, color: Colors.blue.shade800,))
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConfigBtn(text: 'Punto de Oro', onTap: () {
                    btnProvider.puntoDeOro();
                  }, color: btnProvider.goldPoint ? Colors.blue.shade700:Colors.blue.shade200,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConfigBtn(text: 'Ventajas', onTap: () {
                    btnProvider.sistDeVentaja();
                  }, color: btnProvider.ventaja ? Colors.blue.shade700:Colors.blue.shade200,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
