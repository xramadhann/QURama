import 'package:flutter/material.dart';
import 'package:qurama/DzikirView.dart';

void main() {
  runApp(const QURama());
}

class QURama extends StatelessWidget {
  const QURama({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QURama',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x00004258)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const dzikir(),
    );
  }
}
