import 'package:faisal_alanazi_proj2/constants/app_colors.dart';
import 'package:faisal_alanazi_proj2/constants/app_fonts.dart';
import 'package:faisal_alanazi_proj2/constants/game_filters.dart';
import 'package:faisal_alanazi_proj2/models/game.dart';
import 'package:faisal_alanazi_proj2/screens/home_screen/widgets/genre_list.dart';

import 'package:faisal_alanazi_proj2/screens/home_screen/widgets/home_card.dart';
import 'package:faisal_alanazi_proj2/service/api.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Game> allGames = [];
  String selectedGenre = 'All';
  List<Game> get filteredGames {
    if (selectedGenre == 'All') return allGames;
    return allGames.where((game) => game.genre == selectedGenre).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text('PlayZone', style: AppFonts.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: FutureBuilder(
          future: Api().getAllGames(),
          builder: (context, snapshot) {
            var games = snapshot.data;

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (snapshot.connectionState == ConnectionState.done) {
              // apply the selected genre filter
              var filteredGames = selectedGenre == 'All'
                  ? games!
                  : games!.where((g) => g.genre == selectedGenre).toList();

              return ListView(
                children: [
                  GenreList(
                    gameGenres: gameGenres,
                    selectedGenre: selectedGenre,
                    onGenreSelected: (genre) {
                      setState(() {
                        selectedGenre = genre;
                      });
                    },
                  ),

                  const SizedBox(height: 20),
                  Text('Popular now', style: AppFonts.subtitle),
                  const SizedBox(height: 12),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: filteredGames.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 20,
                            childAspectRatio: 0.95,
                          ),
                      itemBuilder: (context, index) {
                        final game = filteredGames[index];
                        return GameCard(game: game);
                      },
                    ),
                  ),
                ],
              );
            }

            return const Center(child: Text('NO DATA'));
          },
        ),
      ),
    );
  }
}

