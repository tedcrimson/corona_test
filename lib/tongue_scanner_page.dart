import 'dart:async';

import 'package:all_sensors/all_sensors.dart';
import 'package:corona_test/result_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TongueScanner extends StatefulWidget {
  @override
  _TongueScannerState createState() => _TongueScannerState();
}

class _TongueScannerState extends State<TongueScanner> {
  double proximity = 10;

  StreamSubscription<ProximityEvent> listener;
  Offset startPos;
  Offset currentPos = Offset.zero;

  bool get isTouching => startPos != null;
  bool get faceClose => proximity == 0.0 || kIsWeb;

  @override
  void initState() {
    super.initState();

    listener = proximityEvents.listen((ProximityEvent event) {
      setState(() {
        // event.getValue return true or false
        proximity = event.proximity;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    listener.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onPanStart: (s) {
          startPos = s.localPosition;
        },
        onPanUpdate: (s) {
          setState(() {
            currentPos = s.localPosition;
          });
        },
        onPanEnd: (s) {
          // endPos = s.velocity;
          double distance = (startPos.dy - currentPos.dy).abs();
          print(distance);
          if (distance > 100 && faceClose) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => ResultPage()));
          }
          setState(() {
            startPos = null;
          });
        },
        child: Stack(
          children: <Widget>[
            Positioned.fill(
                child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        isTouching ? Colors.redAccent : Colors.cyan
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.2, 1])),
              // color: startPos != null ? Colors.redAccent : Colors.cyan,
            )),
            Positioned(
              left: 0,
              right: 0,
              top: 100,
              child: Text(
                'ენის სკანერი',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.cyan),
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 150,
                  ),
                  Icon(Icons.keyboard_arrow_up, size: 50, color: Colors.white),
                  Icon(Icons.keyboard_arrow_up, size: 50, color: Colors.white),
                  Icon(Icons.keyboard_arrow_up, size: 50, color: Colors.white),
                ],
              ),
            ),
            Positioned(
                left: currentPos.dx - 50,
                top: currentPos.dy - 50,
                child: Text(
                  isTouching ? faceClose ? "👅" : "🚫" : "",
                  style: TextStyle(fontSize: 100),
                )),
            Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: Text(
                  "ენა აუსვით\n ქვევიდან ზევით",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, color: Colors.white),
                )),
            // Positioned(
            //   left: 20,
            //   bottom: 20,
            //   child: Text("არა მადლობა"),
            // )
          ],
        ),
      ),
    );
  }
}
