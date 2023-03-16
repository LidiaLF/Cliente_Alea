import 'package:cliente_alea/Values/My_Colors.dart';
import 'package:flutter/material.dart';

Container getBgGradient() {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
      My_Colors.yellow_alea_light,
      My_Colors.yellow_alea_dark
    ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
  );
}
