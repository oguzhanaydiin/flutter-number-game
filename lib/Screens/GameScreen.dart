import 'package:flutter/material.dart';

import '../mainGrid.dart';
import '../sectimer.dart';
import 'Home.dart';
//import '../main.dart';

final playerPointsToAdd = ValueNotifier<int>(0);

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    var backToMenuButton = TextButton(
      onPressed: () {
        //popping 2 screens
        //int count = 0;
        //Navigator.of(context).popUntil((_) => count++ >= 2);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      },
      child: Row(
        children: [
          Icon(
            Icons.arrow_back,
            color: Colors.deepOrange,
          ),
          Text("Back To Menu: ", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
    return Material(
      //our home screen
      child: Column(
        children: [
          Container(
            child: Center(child: backToMenuButton),
            padding: EdgeInsets.all(5),
            color: Colors.blue[200],
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            color: Colors.blue[100],
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueListenableBuilder(
                  valueListenable: counter,
                  builder: (BuildContext context, int value, Widget child) {
                    return Text(
                      'Next#: $value',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    );
                  },
                ),
                Text("Time:"),
                SecTimer(),

                Text("Mode: Light Game",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                //Text("Score: X", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            child: Container(
                child: Center(child: MainGrid()),
                height: MediaQuery.of(context).size.height * 0.2),
            color: Colors.amber[50],
            height: MediaQuery.of(context).size.height * 0.9,
          ),
        ],
      ),
    );
  }
}
