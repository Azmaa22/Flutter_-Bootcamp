import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSoundNote(int noteNumber) {
    final player = AudioCache();
    player.play('note$noteNumber.wav');
    print('Playing note $noteNumber');
  }
  Widget buildNoteKey(int noteNumber, Color color){
    return  Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSoundNote(noteNumber);
        },
        child: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildNoteKey(1, Colors.red),
              buildNoteKey(2, Colors.orange),
              buildNoteKey(3, Colors.yellow),
              buildNoteKey(4, Colors.green),
              buildNoteKey(5, Colors.teal),
              buildNoteKey(6, Colors.blue),
              buildNoteKey(7, Colors.purple),

            ],
          ),
        ),
      ),
    );
  }
}
