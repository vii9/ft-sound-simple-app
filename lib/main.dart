import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void playSound({required int numberSound}) {
      AudioCache player = AudioCache();
      player.play('note$numberSound.wav');
    }

    Expanded buildExpandedKey({
      required Color bgColor,
      required int numberSound,
      String mainText = 'default text',
    }) {
      return Expanded(
        child: TextButton(
            style: TextButton.styleFrom(backgroundColor: bgColor),
            onPressed: () => playSound(numberSound: numberSound),
            child: Text(
              mainText,
              style: const TextStyle(color: Colors.white),
            )),
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black26,
        body: SafeArea(
          child: Column(
            //@todo: check layout
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildExpandedKey(bgColor: Colors.red, numberSound: 1),
              buildExpandedKey(bgColor: Colors.green, numberSound: 2),
              buildExpandedKey(bgColor: Colors.yellow, numberSound: 3),
              buildExpandedKey(bgColor: Colors.teal, numberSound: 4),
              buildExpandedKey(bgColor: Colors.blue, numberSound: 5),
              buildExpandedKey(bgColor: Colors.brown, numberSound: 6),
              buildExpandedKey(bgColor: Colors.deepOrange, numberSound: 7),
            ],
          ),
        ),
      ),
    );
  }
}
