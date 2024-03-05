import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  void playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$soundNumber.wav'));
  }

  Expanded buildKey({Color? color, int? soundNumber}) {
    return Expanded(
      child: ElevatedButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
          playSound(soundNumber!);
        },
        child: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(color: Colors.red[700], soundNumber: 1),
              buildKey(color: Colors.orange[700], soundNumber: 2),
              buildKey(color: Colors.yellow[700], soundNumber: 3),
              buildKey(color: Colors.green[700], soundNumber: 4),
              buildKey(color: Colors.teal[700], soundNumber: 5),
              buildKey(color: Colors.blue[700], soundNumber: 6),
              buildKey(color: Colors.purple[700], soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
