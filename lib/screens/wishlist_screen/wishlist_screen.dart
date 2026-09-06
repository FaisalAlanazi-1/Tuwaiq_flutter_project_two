import 'package:faisal_alanazi_proj2/constants/app_colors.dart';
import 'package:faisal_alanazi_proj2/constants/app_fonts.dart';
import 'package:faisal_alanazi_proj2/service/api.dart';
import 'package:flutter/material.dart';

import '../../constants/wishlist_data.dart';
import '../../models/game_details.dart';

import '../game_details_screen/game_details_screen.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  Future<List<GameDetails>> _loadWishlistGames() async {
    final apiService = Api();
    final games = <GameDetails>[];

    for (final id in wishlistGameIds) {
      final game = await apiService.getGameDetails(id);
      games.add(game);
    }

    return games;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text('Wishlist', style: AppFonts.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder(
          future: _loadWishlistGames(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final games = snapshot.data ?? [];

            if (games.isEmpty) {
              return const Center(
                child: Text(
                  'Your wishlist is empty',
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
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GameDetailsScreen(gameId: game.id),
                        ),
                      );

                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFF1F1F1F),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              game.thumbnail,
                              width: 56,
                              height: 56,
                              fit: BoxFit.cover,
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
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  '${game.genre} : ${game.platform}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white54,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.favorite,
                              color: AppColors.accent,
                            ),
                            onPressed: () {
                              setState(() {
                                toggleWishlist(game.id);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
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
