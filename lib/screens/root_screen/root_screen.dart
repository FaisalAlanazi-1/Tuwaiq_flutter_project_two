import 'package:flutter/material.dart';

import '../home_screen/home_screen.dart';
import '../platforms_screen/platforms_screen.dart';
import '../wishlist_screen/wishlist_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentIndex = 0;

  static const Color accentColor = Color(0xFFFF4B4B);
  static const Color barColor = Color(0xFF141414);

  final List<IconData> icons = const [
    Icons.home_rounded,
    Icons.sports_esports_rounded,
    Icons.favorite_rounded,
  ];

  final List<String> labels = const ['Home', 'Platforms', 'Wishlist'];

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(),
      PlatformsScreen(),
      WishlistScreen(),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: buildFloatingNavBar(),
    );
  }

  Widget buildFloatingNavBar() {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: barColor,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.4), blurRadius: 4),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(icons.length, (index) {
          final isSelected = currentIndex == index;
          return GestureDetector(
            onTap: () => setState(() => currentIndex = index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInCirc,
              width: isSelected ? 52 : 44,
              height: isSelected ? 52 : 44,
              decoration: BoxDecoration(
                color: isSelected ? accentColor : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icons[index],
                color: isSelected ? Colors.white : Colors.white54,
                size: isSelected ? 26 : 22,
              ),
            ),
          );
        }),
      ),
    );
  }
}
