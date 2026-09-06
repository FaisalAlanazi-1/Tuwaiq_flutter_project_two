import 'package:faisal_alanazi_proj2/constants/app_fonts.dart';
import 'package:faisal_alanazi_proj2/models/game.dart';
import 'package:flutter/material.dart';

class GamesByPlatform extends StatelessWidget {
  const GamesByPlatform({
    super.key,
    required this.game,
  });

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF1F1F1F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              game.thumbnail,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
                  Container(
                    width: 56,
                    height: 56,
                    color: Colors.grey[900],
                  ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  game.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppFonts.cardTitle,
                ),
                Text(
                  '${game.genre} : ${game.platform}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppFonts.cardSubtitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}