import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class App1Screen extends StatefulWidget {
  static const routeName = '/app-1';

  @override
  _App1ScreenState createState() => _App1ScreenState();
}

class _App1ScreenState extends State<App1Screen> {
  String audioName = 'buna.mp3';
  String basicTranslated;
  int listIndex = 0;
  List basicPhrases = [
    'buna',
    'buna(Engleza)',
    'ma numesc',
    'ma numesc(Engleza)',
    'cum esti',
    'cum esti(Engleza)',
    'sunt bine',
    'sunt bine(Engleza)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Phrases'),
      ),
      body: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            childAspectRatio: 1.2,
          ),
          
          itemCount: basicPhrases.length,
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (BuildContext context, int index) {
            return Item(index, basicPhrases);
          },
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  Item(this.index, this.basicPhrases);
  String songName = '';
  List basicPhrases = null;
  int index = null;
  AudioCache audio = AudioCache();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        songName = basicPhrases[index].toString() + '.mp3';
        audio.load(songName);
        audio.play(songName);
      },
      child: Container(
        color: Colors.blue,
        alignment: AlignmentDirectional.center,
        child: index % 2 == 0
            ? Text(basicPhrases[index])
            : Text(basicPhrases[index]),
      ),
    );
  }
}
