import 'package:flutter/material.dart';
import 'gameFile.dart';
import 'finishFile.dart';
import 'instructionFile.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'ins',
    routes: {
      'ins':(context)=>instructions(),
      'fir':(context)=>gamepage(),
      'sec': (context)=>endgame(),
    },
  ));
}
