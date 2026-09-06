import 'package:faisal_alanazi_proj2/constants/app_colors.dart';
import 'package:faisal_alanazi_proj2/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class GenreList extends StatelessWidget {
  final List<String> gameGenres;
  final String selectedGenre;
  final Function(String) onGenreSelected;

  const GenreList({
    super.key,
    required this.gameGenres,
    required this.selectedGenre,
    required this.onGenreSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: gameGenres.length,
        separatorBuilder: (context, index) => const SizedBox(width: 18),
        itemBuilder: (context, index) {
          final genre = gameGenres[index];
          final isSelected = (genre == selectedGenre);

          return ChoiceChip(
            label: Text(genre),
            selected: isSelected,
            onSelected: (value) {
              onGenreSelected(genre);
            },
            backgroundColor: Color(0xFF1B1B1E),
            selectedColor: AppColors.accent,
            labelStyle: AppFonts.cardTitle.copyWith(
              color: isSelected ? Colors.white : Colors.white70,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          );
        },
      ),
    );
  }
}
