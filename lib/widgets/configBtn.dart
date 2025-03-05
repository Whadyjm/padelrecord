import 'package:flutter/material.dart';

class ConfigBtn extends StatelessWidget {
  ConfigBtn({super.key, required this.text, required this.onTap, required this.color});

  final String text;
  final Color color;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(child: Text(text, style: const TextStyle(fontFamily: 'sf-pro-display', color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700),)),
      ),
    );
  }
}
