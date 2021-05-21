import 'package:flutter/material.dart';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

AudioCache player = new AudioCache();
AudioPlayer advancedPlayer = AudioPlayer();

void playFile(String filename) async {
  advancedPlayer = await player.play("$filename.mp3"); // assign player here
}

void stopFile(String filename) async {
  // player.clearCache();
  // player.clear("$filename.mp3");
  advancedPlayer?.stop();
  advancedPlayer.setReleaseMode(ReleaseMode.STOP);
  // stop the file like this
}

List data = [
  'They are',
  'Taking',
  'The Hobbits',
  'To Isengard',
  'Instrumental',
  'Original',
  'Original with Remix',
  'Yes',
  'Bonus',
  'Bonus 2'
];

// ignore: must_be_immutable
class DrumPad extends StatelessWidget {
  Random random = new Random();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Legolas Pad'),
          backgroundColor: Colors.greenAccent,
        ),
        body: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/gandalf.gif"),
                  fit: BoxFit.contain)),
          child: OrientationBuilder(
            builder: (context, orientation) {
              return GridView.builder(
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        orientation == Orientation.portrait ? 3 : 4),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onLongPress: () => stopFile(data[index]),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: RaisedButton(
                          child: Text(data[index]),
                          color: Colors.primaries[
                              Random().nextInt(Colors.primaries.length)],
                          splashColor: Color(
                                  (Random().nextDouble() * 0xFFFFFF).toInt() <<
                                      0)
                              .withOpacity(1.0),
                          onPressed: () => playFile(data[index]),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
