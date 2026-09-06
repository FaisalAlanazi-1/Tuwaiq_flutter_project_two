import 'package:faisal_alanazi_proj2/constants/app_colors.dart';
import 'package:faisal_alanazi_proj2/constants/app_fonts.dart';
import 'package:faisal_alanazi_proj2/constants/wishlist_data.dart';

import 'package:faisal_alanazi_proj2/screens/game_details_screen/widgets/info_card.dart';
import 'package:faisal_alanazi_proj2/screens/game_details_screen/widgets/status_widget.dart';
import 'package:faisal_alanazi_proj2/service/api.dart';
import 'package:flutter/material.dart';

class GameDetailsScreen extends StatefulWidget {
  final int gameId;

  const GameDetailsScreen({required this.gameId, super.key});

  static const Color accentColor = Color(0xFFFF4B4B);

  @override
  State<GameDetailsScreen> createState() => _GameDetailsScreenState();
}

class _GameDetailsScreenState extends State<GameDetailsScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: FutureBuilder(
        future: Api().getGameDetails(widget.gameId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final game = snapshot.data;
          if (game == null) {
            return const Center(
              child: Text(
                'Game not found.',
                style: TextStyle(color: Colors.white54),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        game.thumbnail,
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 28,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: CircleAvatar(
                            backgroundColor: Colors.black54,
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(game.title, style: AppFonts.title),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  toggleWishlist(game.id);
                                  isSelected = isInWishlist(widget.gameId);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: GameDetailsScreen.accentColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                isSelected ? 'In Wishlist ✓' : 'Wish List',
                                style: AppFonts.cardTitle.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          spacing: 10,
                          children: [
                            GenreWidget(game: game),

                            StatusWidget(game: game),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Description',
                          style: AppFonts.subtitle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          game.description.isNotEmpty
                              ? game.description
                              : game.shortDescription,
                          style: AppFonts.body,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: InfoCard(
                                label: 'DEVELOPER',
                                value: game.developer,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: InfoCard(
                                label: 'PUBLISHER',
                                value: game.publisher,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: InfoCard(
                                label: 'RELEASE DATE',
                                value: game.releaseDate,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: InfoCard(
                                label: 'PLATFORM',
                                value: game.platform,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          return Center(child: Text('No Data'));
        },
      ),
    );
  }
}
