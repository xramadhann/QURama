import 'package:flutter/material.dart';

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
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 8),
      width: 360,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.orange,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: const Duration(milliseconds: 800),
                tabBackgroundColor: Colors.orangeAccent,
                tabs: const [
                  GButton(
                    icon: CupertinoIcons.house_alt,
                  ),
                  GButton(
                    icon: CupertinoIcons.gift,
                  ),
                  GButton(
                    icon: CupertinoIcons.qrcode_viewfinder,
                  ),
                  GButton(
                    icon: Icons.history_rounded,
                  ),
                  GButton(
                    icon: CupertinoIcons.person,
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
