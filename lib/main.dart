import 'package:corona_test/questions/what_is_corona.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/corona.gif"), fit: BoxFit.cover),
          ),
          child: Container(
            color: Colors.black45,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("კორონას ტესტი",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 40)),
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text("გაიგე დაინფიცირებული ხარ თუ არა",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70, fontSize: 20)),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Material(
                  borderRadius: BorderRadius.circular(25),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => WhatIsCorona()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20),
                      child: Text("დაწყება",
                          style: TextStyle(color: Colors.white, fontSize: 25)),
                    ),
                  ),
                  color: Colors.blue,
                  // padding: EdgeInsets.all(30),
                  // minWidth: 150,
                )
              ],
            )),
          )),
    );
  }
}
