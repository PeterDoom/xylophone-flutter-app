import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  var colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple
  ];

  Widget buildKey(Color buttonColor, int position) {
    return Expanded(
      child: FlatButton(
        color: buttonColor,
        onPressed: () {
          playSound(position);
        },
      ),
    );
  }

  List<Widget> buildKeys() {
    List<Widget> allButtons = [];
    for (int i = 0; i < colors.length; i++) {
      allButtons.add(buildKey(colors[i], i + 1));
    }
    return allButtons;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildKeys(),
          ),
        ),
      ),
    );
  }
}
