import 'package:faisal_alanazi_proj2/models/game_details.dart';
import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({super.key, required this.game});

  final GameDetails? game;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(game!.status, style: const TextStyle(color: Colors.white)),
      backgroundColor: Colors.black,
      padding: EdgeInsets.zero,
    );
  }
}

class GenreWidget extends StatelessWidget {
  const GenreWidget({super.key, required this.game});

  final GameDetails? game;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(game!.genre, style: const TextStyle(color: Colors.white)),
      backgroundColor: Colors.black,
      padding: EdgeInsets.zero,
    );
  }
}