import 'package:flutter/material.dart';
import 'dart:async';

class CountTimerPage extends StatefulWidget {
  const CountTimerPage({super.key});

  @override
  State<CountTimerPage> createState() => CountTimerPageState();
}

class CountTimerPageState extends State<CountTimerPage>{
  int focusTime = 10;
  int breakTime = 10;

  int focusTimeCount = 0;
  int breakTimeCount = 0;

  bool focusTimer = false;
  bool breakTimer = false;

  void focusTimerStart() {
    focusTimer = true;
    // focusTimeCount++;
    // setState(() {});
  }

  void initState(){
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if( focusTimer ){
        focusTimeCount++;
        if( focusTime == focusTimeCount ){
          focusTimeCount = 0;
          focusTimer = false;
          breakTimer = true;
        }
      } else if( breakTimer ) {
        breakTimeCount++;
        if (breakTime == breakTimeCount) {
          breakTimeCount = 0;
          focusTimer = true;
          breakTimer = false;
        }
      }
      setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('timer', style: TextStyle(color: Colors.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('${focusTime - focusTimeCount}',
                        style: const TextStyle(color: Colors.white)),
                    const Text('/', style: TextStyle(color: Colors.white)),
                    Text('${breakTime - breakTimeCount}',
                        style: const TextStyle(color: Colors.white))
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    focusTimerStart();
                  },
                  child: const Icon(Icons.play_arrow),
                )
              ]),
        )));
  }
}
