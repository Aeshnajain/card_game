import 'package:flutter/material.dart';
import 'dart:math';

class instructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar( title: Text("HOW TO PLAY",style: TextStyle(fontFamily: 'orelega',fontSize: 30),),
        centerTitle: true,
        backgroundColor: Colors.cyan,),
      body: ListView(
          children: [
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 12),
               child: checkTile(),
             ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:80.0,),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'fir');
                },
                child: Text("START",style: TextStyle(fontFamily: 'orelega',fontWeight: FontWeight.bold,fontSize: 20,),),
              ),
            )
          ]),
    );
  }
}

class checkTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        myTile(txt: "The card on the top of the screen is 'PLAYER-1'."),
        myTile(txt: "The Player below the top card is 'PLAYER-2'."),
        myTile(txt: "The Game starts with 'PLAYER-1'."),
        myTile(txt: "Each player will alternatively get the chance to press the card."),
        myTile(txt: "If the new card that appears on the screen is similar to card of the previous player then the player who had pressed the card wins!"),
        myTile(txt: "The player who wins 5 times out of 9 iterations wins the GAME!"),

      ],
    );
  }
}


class myTile extends StatelessWidget {
  String txt;
  myTile({@required this.txt});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.done_all,size: 25, color: Colors.black,),
      title: Text(txt,style: TextStyle(fontFamily: 'orelega',fontSize: 25)),
    );
  }
}


