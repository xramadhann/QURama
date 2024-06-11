import 'package:flutter/material.dart';
import 'package:qurama/DzikirView.dart';
import 'package:google_fonts/google_fonts.dart';

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
        fontFamily: 'Harabara',
        textTheme: GoogleFonts.alataTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
      home: const dzikir(),
    );
  }
}
