import 'package:faisal_alanazi_proj2/constants/app_fonts.dart';
import 'package:faisal_alanazi_proj2/models/game.dart';
import 'package:faisal_alanazi_proj2/screens/game_details_screen/game_details_screen.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  const GameCard({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameDetailsScreen(gameId: game.id),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(game.thumbnail, fit: BoxFit.fill),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.0),
                    Colors.black.withValues(alpha: 0.9),
                  ],
                ),
              ),
            ),

            Positioned(
              left: 10,
              right: 10,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    game.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.cardTitle,
                  ),
                  Text(game.genre, style: AppFonts.cardSubtitle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}