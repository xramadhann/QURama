// ignore_for_file: file_names, deprecated_member_use, prefer_const_constructors

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Kiblat extends StatefulWidget {
  const Kiblat({super.key, required int currentIndex});

  @override
  State<Kiblat> createState() => _KiblatState();
}

class _KiblatState extends State<Kiblat> {
  MagnetometerEvent _magneticEvent = MagnetometerEvent(0, 0, 0);
  StreamSubscription? subscription;

  @override
  void initState() {
    super.initState();
    subscription = magnetometerEvents.listen((event) {
      setState(() {
        _magneticEvent = event;
      });
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  double calculateDegrees(double x, double y) {
    double heading = atan2(x, y);
    // Convert from radians to degrees
    heading = heading * 180 / pi;
    // Ensure that the heading is between 0 and 360 degrees

    if (heading > 0) {
      heading -= 360;
    }
    return heading * -1;
  }

  @override
  Widget build(BuildContext context) {
    final degrees = calculateDegrees(_magneticEvent.x, _magneticEvent.y);
    final angle = -1 * pi / 180 * degrees;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              'Kiblat',
              style: TextStyle(fontSize: 30),
            ),
            Text('${degrees.toStringAsFixed(0)} °'),
            Expanded(
              child: Center(
                child: Transform.rotate(
                  angle: angle,
                  child: Image.asset(
                    'assets/images/qibla.png',
                    height: MediaQuery.of(context).size.height * 0.8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
