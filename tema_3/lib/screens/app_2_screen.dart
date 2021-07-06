import 'package:flutter/material.dart';

class App2Screen extends StatefulWidget {
  static const routeName = '/app-2';
  @override
  _App2ScreenState createState() => _App2ScreenState();
}

class _App2ScreenState extends State<App2Screen> {
  List<bool> elements = List<bool>.generate(9, (index) => null);
  int whatPlayer = 0;
  List<int> l1 = [0, 0, 0];
  List<int> l2 = [0, 0, 0];
  List<int> l3 = [0, 0, 0];
  List<int> c1 = [0, 0, 0];
  List<int> c2 = [0, 0, 0];
  List<int> c3 = [0, 0, 0];

  void changeMatrix(int index) {
    if (index == 1) {
      l1[1] = whatPlayer;
      c1[1] = whatPlayer;
    } else if (index == 2) {
      l1[2] = whatPlayer;
      c2[1] = whatPlayer;
    } else if (index == 3) {
      l1[3] = whatPlayer;
      c3[1] = whatPlayer;
    } else if (index == 4) {
      l2[1] = whatPlayer;
      c1[2] = whatPlayer;
    } else if (index == 5) {
      l2[2] = whatPlayer;
      c2[2] = whatPlayer;
    } else if (index == 6) {
      l2[3] = whatPlayer;
      c3[2] = whatPlayer;
    } else if (index == 7) {
      l3[1] = whatPlayer;
      c1[3] = whatPlayer;
    } else if (index == 8) {
      l3[2] = whatPlayer;
      c2[3] = whatPlayer;
    } else if (index == 9) {
      l3[3] = whatPlayer;
      c3[3] = whatPlayer;
    }
  }

  void validator() {
    int i, s1, s2, s3, s4, s5, s6;
    for (i = 1; i < 3; i = i + 1) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Phrases'),
      ),
      body: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            childAspectRatio: 1.2,
          ),
          itemCount: 9,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Container(
                padding: EdgeInsets.all(0.0),
                margin: EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                decoration: BoxDecoration(
                  color: whatPlayer == 0
                      ? Colors.white
                      : (whatPlayer == 1 ? Colors.blue : Colors.red),
                  border: Border.all(color: Color(0xFF282f61), width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(14.0)),
                ),
              ),
              onTap: () {
                setState(() {
                  changeMatrix(index);
                  if (whatPlayer == 0) {
                    whatPlayer = 1;
                  } else if (whatPlayer == 1)
                    whatPlayer = -1;
                  else if (whatPlayer == -1) whatPlayer = 1;
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  Item({
    @required this.index,
    @required this.isColor,
    @required this.whatPlayer,
    @required this.onTap,
  });
  bool isColor;
  int index;
  int whatPlayer;
  void Function(bool whatColor) onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(0.0),
        margin:
            EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFF282f61), width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
        ),
      ),
      onTap: () {
        if (whatPlayer == 1) onTap(true);
        if (whatPlayer == -1) onTap(false);
      },
    );
  }
}
