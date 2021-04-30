import 'package:flutter/material.dart';
import 'dart:math';
import 'finishFile.dart';

class gamepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text("CARD GAME",style: TextStyle(fontFamily: 'orelega',fontSize: 30),),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: mystate(),
    );
  }
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
  List<Icon> up=[];
  List<Icon> down=[];
  int uc=0;
  int dc=0;

  void makechange1()
  {
    setState(() {
      int pv = leftimage;
      do {
        leftimage = Random().nextInt(6) + 1;
      } while (pv == leftimage);
      val = 0;
      mvar = false;
      if (leftimage == rightimage) {
        uc++;
        if(uc>=5){
          Navigator.push(context, MaterialPageRoute(builder: (context){return endgame(winner:1);},),);
        }
        val = 1;
        up.add(Icon(Icons.mood,color: Colors.white70,size:35));
        down.add(Icon(Icons.mood_bad,color: Colors.black,size:35));
        

      }
    });
  }

  void makechange2()
  {
    setState(() {
      int pv = rightimage;
      do {
        rightimage = Random().nextInt(6) + 1;
      } while (pv == rightimage);
      val = 0;
      mvar = true;
      if (leftimage == rightimage) {
        dc++;
        if(dc>=5){
          Navigator.push(context, MaterialPageRoute(builder: (context){return endgame(winner:2);},),);
        }
        val = 2;
        down.add(Icon(Icons.mood,color: Colors.white70,size:35));
        up.add(Icon(Icons.mood_bad,color: Colors.black,size:35));
        
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(

        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40,10,40,0),
            child: Row(
              children: up,
            ),
          ),
          Expanded(
              child: FlatButton(
                  onPressed: mvar ? makechange1 : () {},
                  child: mychild(myimage: leftimage,)
              )
          ),
          mytext(myval: val,myconst: 1,),
          mytext(myval: val,myconst: 2,),
          Expanded(
              child: FlatButton(
                onPressed: !mvar ? makechange2 : () {},
                child: mychild(myimage: rightimage,),
              )
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40,0,40,10),
            child: Row(
              children: down,
            ),
          )
        ],
      ),
    );
  }
}

class mytext extends StatelessWidget {
  int myval;
  int myconst;
  mytext({this.myval,this.myconst});
  @override
  Widget build(BuildContext context) {
    return Text(
      'PLAYER$myval WINS!',
      style: TextStyle(
        fontFamily: 'orelega',
        color: myval == myconst ? Colors.black : Colors.transparent,
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
      ),
    );
  }
}
class mychild extends StatelessWidget {

  int myimage;
  mychild({this.myimage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        child: Image.asset(
          'images/$myimage.png',
        ),
        borderRadius: BorderRadius.circular(7.0),
      ),
    );
  }
}





