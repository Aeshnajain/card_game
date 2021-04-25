import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text("The Card Game"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: mystate(),
    ),
  ));
}

class mystate extends StatefulWidget {
  @override
  _mystate createState() => _mystate();
}

class _mystate extends State<mystate> {
  int rightimage = 1;
  int leftimage = 2;
  int val = 0;
  bool mvar = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
              child: FlatButton(
                  onPressed: mvar
                      ? () {
                          setState(() {
                            int pv = leftimage;
                            do {
                              leftimage = Random().nextInt(6) + 1;
                            } while (pv == leftimage);
                            val = 0;
                            mvar = false;
                            if (leftimage == rightimage) {
                              val = 1;
                            }
                          });
                        }
                      : () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7.0),
                      child: Image.asset(
                        'images/$leftimage.png',
                      ),
                    ),
                  ))),
          Text(
            'Player1 is the winner',
            style: TextStyle(
              color: val == 1 ? Colors.black : Colors.transparent,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          Text(
            'Player2 is the winner',
            style: TextStyle(
              color: val == 2 ? Colors.black : Colors.transparent,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          Expanded(
              child: FlatButton(
                  onPressed: !mvar
                      ? () {
                          setState(() {
                            int pv = rightimage;
                            do {
                              rightimage = Random().nextInt(6) + 1;
                            } while (pv == rightimage);
                            val = 0;
                            mvar = true;
                            if (leftimage == rightimage) {
                              val = 2;
                            }
                          });
                        }
                      : () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      child: Image.asset(
                        'images/$rightimage.png',
                      ),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  )
              )
          ),
        ],
      ),
    );
  }
}
