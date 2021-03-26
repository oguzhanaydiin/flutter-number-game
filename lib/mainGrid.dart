import 'package:flutter/material.dart';
import './sectimer.dart';
import 'Screens/GameOverScreen.dart';

List<int> list;
List<double> timeList;
List<bool> visibilityList;
ValueNotifier<int> counter = ValueNotifier<int>(1);
double initialTime;
double temp;
double firstTime;
double lastTime;
double bestTime = 1000;

int currentTimeInSeconds() {
  var ms = (new DateTime.now()).millisecondsSinceEpoch;
  return (ms / 1).round();
}

class MainGrid extends StatefulWidget {
  @override
  _MainGridState createState() => _MainGridState();
}

class _MainGridState extends State<MainGrid> {
  @override
  void initState() {
    initialTime = currentTimeInSeconds() / 1000;
    firstTime = initialTime;
    counter.value = 1;
    list = [for (var i = 1; i < 26; i += 1) i];
    list.shuffle();
    visibilityList = [for (var i = 1; i < 26; i += 1) true];
    timeList = [for (var i = 1; i < 26; i += 1) 0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return GridView.count(
        //shrinkWrap: true,
        childAspectRatio: (itemWidth / itemHeight),
        physics: NeverScrollableScrollPhysics(),
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 5,
        children: list
            .map(
              (e) => new InkWell(
                onTap: !visibilityList[e - 1]
                    ? null
                    : () {
                        setState(() {
                          if (counter.value == e) {
                            temp = currentTimeInSeconds() / 1000;
                            timeList[e - 1] = temp - initialTime;
                            initialTime = temp;
                            counter.value++;
                            visibilityList[e - 1] = false;
                            if (counter.value == 26) {
                              lastTime = currentTimeInSeconds() / 1000;
                              lastTime = lastTime - firstTime;

                              if (lastTime < bestTime) {
                                bestTime = lastTime;
                              }
                              timer.cancel();
                              //Navigator.push(
                              //context,
                              //MaterialPageRoute(
                              //builder: (context) => GameOverScreen()));
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GameOverScreen()));
                            }
                          }
                        });
                      },
                child: Visibility(
                  visible: visibilityList[e - 1],
                  child: Container(
                    child: Center(
                      child: new Text(
                        e.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    color: Colors.teal[200],
                  ),
                ),
              ),
            )
            .toList());
  }
}
