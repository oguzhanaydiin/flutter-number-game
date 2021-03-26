import 'dart:ui';

import 'package:flutter/material.dart';
import 'GameScreen.dart';
import 'Home.dart';

class ModInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goToGameScreen = TextButton(
      onPressed: () {
        //Navigator.push(
        //context, MaterialPageRoute(builder: (context) => GameScreen()));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => GameScreen()));
      },
      child: Text("Start", style: TextStyle(fontWeight: FontWeight.bold)),
    );

    var goToHomeButton = TextButton(
      onPressed: () {
        //Navigator.pop(context);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      },
      child: Row(
        children: [
          Icon(
            Icons.arrow_back,
            color: Colors.deepOrange,
          ),
          Text("Back To Menu", style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    );
    return Material(
      //our home screen
      child: Column(
        children: [
          Container(
            child: Center(
              child: goToHomeButton,
            ),
            padding: EdgeInsets.all(5),
            color: Colors.blue[200],
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.blue[100],
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Mode:light"),
              ],
            )),
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            child: Column(
              children: [
                Text(
                  "Mode: Classic Light",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text("Relax and Concentrate!",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                Text(
                    "Focus in the center box of table. Try to see whole table.",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                Text("Click on the numbers in ascending order from 1 to 25",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: Colors.orange)),
                Container(
                  padding: EdgeInsets.all(30),
                  child: Center(
                    child: Container(
                      color: Colors.orange,
                      child: goToGameScreen,
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                  ),
                ),
              ],
            ),
            color: Colors.amber[50],
            height: MediaQuery.of(context).size.height * 0.9,
          ),
        ],
      ),
    );
  }
}
