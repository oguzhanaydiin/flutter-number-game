import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import '../mainGrid.dart';

import 'GameScreen.dart';
import 'Home.dart';

class GameOverScreen extends StatelessWidget {
  final sira = [for (var i = 1; i < 26; i += 1) i.toString()];

  @override
  Widget build(BuildContext context) {
    var goToGameScreen = TextButton(
      onPressed: () {
        //Navigator.pop(context);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => GameScreen()));
      },
      child: Text("Play Again", style: TextStyle(fontWeight: FontWeight.bold)),
    );

    var goToHomeButton = TextButton(
      onPressed: () {
        //int count = 0;
        //Navigator.of(context).popUntil((_) => count++ >= 3);
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                Text(
                    "Game Over in ${lastTime.toString().substring(0, (lastTime.toString().length) - 11)} seconds, your best is: ${bestTime.toString()}",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                Container(
                  padding: EdgeInsets.all(30),
                  child: Center(
                    child: Container(
                      color: Colors.orange,
                      child: goToGameScreen,
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Chart(
                    data: [
                      {'sira': sira[0], 'sure': timeList[0]},
                      {'sira': sira[1], 'sure': timeList[1]},
                      {'sira': sira[2], 'sure': timeList[2]},
                      {'sira': sira[3], 'sure': timeList[3]},
                      {'sira': sira[4], 'sure': timeList[4]},
                      {'sira': sira[5], 'sure': timeList[5]},
                      {'sira': sira[6], 'sure': timeList[6]},
                      {'sira': sira[7], 'sure': timeList[7]},
                      {'sira': sira[8], 'sure': timeList[8]},
                      {'sira': sira[9], 'sure': timeList[9]},
                      {'sira': sira[10], 'sure': timeList[10]},
                      {'sira': sira[11], 'sure': timeList[11]},
                      {'sira': sira[12], 'sure': timeList[12]},
                      {'sira': sira[13], 'sure': timeList[13]},
                      {'sira': sira[14], 'sure': timeList[14]},
                      {'sira': sira[15], 'sure': timeList[15]},
                      {'sira': sira[16], 'sure': timeList[16]},
                      {'sira': sira[17], 'sure': timeList[17]},
                      {'sira': sira[18], 'sure': timeList[18]},
                      {'sira': sira[19], 'sure': timeList[19]},
                      {'sira': sira[20], 'sure': timeList[20]},
                      {'sira': sira[21], 'sure': timeList[21]},
                      {'sira': sira[22], 'sure': timeList[22]},
                      {'sira': sira[23], 'sure': timeList[23]},
                      {'sira': sira[24], 'sure': timeList[24]},
                    ],
                    scales: {
                      'sira': CatScale(
                        accessor: (map) => map['sira'] as String,
                      ),
                      'sure': LinearScale(
                        accessor: (map) => map['sure'] as num,
                        nice: true,
                      )
                    },
                    geoms: [
                      IntervalGeom(
                        position: PositionAttr(field: 'sira*sure'),
                      )
                    ],
                    axes: {
                      'sira': Defaults.horizontalAxis,
                      'sure': Defaults.verticalAxis,
                    },
                  ),
                )
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
