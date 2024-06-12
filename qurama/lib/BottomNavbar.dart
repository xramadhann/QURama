// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavbar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTabTapped;
  const BottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTabTapped,
  });

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      width: 360,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: const Color.fromARGB(255, 0, 66, 88),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: GNav(
                gap: 10,
                activeColor: const Color.fromARGB(255, 0, 66, 88),
                color: Colors.white,
                iconSize: 34,
                textSize: 20,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                duration: const Duration(milliseconds: 800),
                tabBackgroundColor: Colors.white,
                tabs: const [
                  GButton(
                    icon: CupertinoIcons.house_alt,
                    text: "Beranda",
                    textSize: 20,
                  ),
                  GButton(
                    icon: CupertinoIcons.compass,
                    text: "Kiblat",
                  ),
                  GButton(
                    icon: CupertinoIcons.light_max,
                    text: "Dzikir",
                  ),
                ],
                selectedIndex: widget.currentIndex,
                onTabChange: (index) {
                  widget.onTabTapped(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
