import 'package:flutter/material.dart';
import 'dart:math';

class endgame extends StatelessWidget {
  int winner;
  endgame({this.winner});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar( title: Text("RESULTS",style: TextStyle(fontFamily: 'orelega',fontSize: 30),),
        centerTitle: true,
        backgroundColor: Colors.cyan,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
              "Player$winner is the Winner!",
              style: TextStyle(fontFamily: 'orelega',fontWeight: FontWeight.bold,fontSize: 35,),
          ),
            ),
        RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, 'fir');
          },
          child: Text("RESTART",style: TextStyle(fontFamily: 'orelega',fontWeight: FontWeight.bold,fontSize: 20,),),
        )
      ]),
    );
  }
}
