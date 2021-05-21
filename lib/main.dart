import 'package:flutter/material.dart';

import 'drums.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Legolas Pad',
    home: MyApp(),
  ));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Legolas Pad'),
          backgroundColor: Colors.deepOrange,
        ),
        body: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/legolas.png"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(top: 400),
                child: RaisedButton(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF00F9FF),
                          Color(0xFFFF9A00),
                          Color(0xFF00F9FF),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: const Text('Başla', style: TextStyle(fontSize: 20)),
                  ),

                  // child: Text(
                  //   "Başla!",
                  //   style: TextStyle(fontFamily: 'Glegoo', fontSize: 16),
                  // ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DrumPad(),
                        ));
                  },
                ),
              ),
              SizedBox(
                height: 150,
              ),
              Container(
                child: Container(
                  child: Text(
                    "Designed For LOTR Fans",
                    style: TextStyle(
                        fontFamily: 'Glegoo',
                        fontSize: 24,
                        fontStyle: FontStyle.normal,
                        color: Colors.orangeAccent),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
