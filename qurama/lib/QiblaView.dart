// ignore_for_file: file_names

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class Qibla extends StatefulWidget {
  const Qibla({super.key, required int currentIndex});

  @override
  State<Qibla> createState() => _QiblaState();
}

class _QiblaState extends State<Qibla> {
  double? heading = 0;
  final double offset =
      288 - (-64); // Offset yang diperoleh dari perbedaan heading

  @override
  void initState() {
    super.initState();
    FlutterCompass.events!.listen((event) {
      setState(() {
        heading = (event.heading ?? 0) + offset;
        if (heading! >= 360) {
          heading = heading! - 360;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(20.0)),
            const Text(
              "qibla",
              style: TextStyle(fontSize: 40),
            ),
            Text(
              "${heading!.ceil()}°",
              style: const TextStyle(fontSize: 20),
            ),
            const Padding(padding: EdgeInsets.all(20.0)),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Transform.rotate(
                    angle: -((heading ?? 180) * (pi / 180) * 1),
                    child: Image.asset("assets/images/compass.png"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
