import 'package:flutter/material.dart';
//import './GameScreen.dart';
import './ModInfoScreen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goToGameScreen = TextButton(
      onPressed: () {
        //Navigator.pushReplacement
        //context, MaterialPageRoute(builder: (context) => ModInfoScreen()));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ModInfoScreen()));
      },
      style: TextButton.styleFrom(
        primary: Colors.black,
        padding: EdgeInsets.all(0.0),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.4,
        color: Colors.amber[300],
        child: Center(
            child: Text('Light Game Mode', style: TextStyle(fontSize: 25))),
      ),
    );

    return Material(
      //our home screen
      child: Column(
        children: [
          Container(
            child: Center(
              child: Text(
                "Schulte Table",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            padding: EdgeInsets.all(5),
            color: Colors.blue[200],
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.blue[100],
            child:
                Center(child: Text("Choose one of the game modes to start:")),
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            color: Colors.amber[50],
            child: Center(
              child: goToGameScreen,
            ),
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 1,
          ),
        ],
      ),
    );
  }
}
