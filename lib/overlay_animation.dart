import 'dart:math';

import 'package:flutter/material.dart';

class OverlayAnimation extends StatelessWidget {
  final Widget child;
  final int count;
  final Tween tween;
  final Curve curve;
  final double opacity;

  OverlayAnimation({
    @required this.child,
    this.tween,
    this.curve,
    this.count = 1,
    this.opacity = 0.8,
  });
  @override
  Widget build(BuildContext context) {
    int maxmili = 0;
    var w = List.generate(count, (index) {
      var milliseconds = 1000 + (Random().nextDouble() * 1000).toInt();
      maxmili = max(maxmili, milliseconds);
      return buildPositioned(context, milliseconds, child);
    });
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: TweenAnimationBuilder<double>(
        builder: (BuildContext context, value, Widget child) {
          return Container(
            color: Colors.black
                .withOpacity((opacity - (value - 0.5).abs()).clamp(0.01, 1)),
            child: child,
          );
        },
        duration: Duration(milliseconds: maxmili),
        tween: Tween<double>(begin: 0, end: 1),
        child: Stack(
          children: w,
        ),
        onEnd: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Widget buildPositioned(BuildContext context, int milliseconds, Widget child) {
    var x = Random().nextDouble() * 1;
    var y = Random().nextDouble() * 1;
    var yF = min(1.0, 0.4 + Random().nextDouble());
    // print("$x + $y");
    return TweenAnimationBuilder<Offset>(
      tween:
          tween ?? new Tween(begin: new Offset(x, 0), end: new Offset(y, yF)),
      duration: Duration(milliseconds: milliseconds),
      curve: curve ?? Cubic(0.15, 0.8, 0.8, 0.15),
      child: child,
      builder: (_, offset, c) {
        return Stack(children: <Widget>[
          Positioned(
            left: offset.dx * MediaQuery.of(context).size.width,
            bottom: offset.dy * MediaQuery.of(context).size.height,
            child: Opacity(opacity: offset.dy + 0.01 > yF ? 0 : 1, child: c),
          ),
        ]);
      },
    );
  }
}
