// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:qurama/BottomNavbar.dart';
import 'package:qurama/DzikirView.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qurama/KiblatView.dart';

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
        useMaterial3: true,
        fontFamily: 'Harabara',
        textTheme: GoogleFonts.righteousTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0x00004258))
            .copyWith(background: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyBottomNavbar(),
    );
  }
}

class MyBottomNavbar extends StatefulWidget {
  const MyBottomNavbar({super.key});

  @override
  _MyBottomNavbarState createState() => _MyBottomNavbarState();
}

class _MyBottomNavbarState extends State<MyBottomNavbar> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const dzikir(currentIndex: 0),
    const Kiblat(currentIndex: 1),
    const dzikir(currentIndex: 2),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavbar(
        currentIndex: currentIndex,
        onTabTapped: onTabTapped,
      ),
    );
  }
}
