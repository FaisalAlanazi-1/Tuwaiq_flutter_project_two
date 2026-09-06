import 'package:faisal_alanazi_proj2/constants/app_colors.dart';
import 'package:faisal_alanazi_proj2/constants/app_fonts.dart';

import 'package:faisal_alanazi_proj2/screens/platform_games_screen/widgets/games_platform.dart';
import 'package:faisal_alanazi_proj2/service/api.dart';
import 'package:flutter/material.dart';

import '../game_details_screen/game_details_screen.dart';

class PlatformGamesScreen extends StatelessWidget {
  final String platformApiValue;
  final String platformLabel;

  const PlatformGamesScreen({
    required this.platformApiValue,
    required this.platformLabel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(platformLabel, style: AppFonts.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder(
          future: Api().getGamesByPlatform(platformApiValue),
          builder: (context, snapshot) {
            var games = snapshot.data;

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (games == null || games.isEmpty) {
              return const Center(
                child: Text(
                  'No games found for this platform',
                  style: TextStyle(color: Colors.white54),
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.separated(
                itemCount: games.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final game = games[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            GameDetailsScreen(gameId: game.id),
                      ),
                    ),
                    child: GamesByPlatform(game: game),
                  );
                },
              );
            }
            return Center(child: Text('No Data'));
          },
        ),
      ),
    );
  }
}
