import 'package:faisal_alanazi_proj2/constants/app_fonts.dart';
import 'package:faisal_alanazi_proj2/screens/platform_games_screen/platform_games_screen.dart';
import 'package:flutter/material.dart';

class PlatformCard extends StatelessWidget {
  const PlatformCard({
    super.key,
    required this.apiValue,
    required this.label,
    required this.icon,
  });

  final String apiValue;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlatformGamesScreen(
              platformApiValue: apiValue,
              platformLabel: label,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1F1F1F),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(icon, color: Colors.white70, size: 26),
            const SizedBox(height: 10),
            Text(label, style: AppFonts.cardTitle),
          ],
        ),
      ),
    );
  }
}