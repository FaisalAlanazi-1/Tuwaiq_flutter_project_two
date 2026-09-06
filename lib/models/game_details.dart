import 'package:faisal_alanazi_proj2/models/game.dart';

class GameDetails extends Game {
  final String status;
  final String description;

  GameDetails({required this.status, required this.description, required super.id, required super.title, required super.thumbnail, required super.shortDescription, required super.genre, required super.platform, required super.publisher, required super.developer, required super.releaseDate});

  factory GameDetails.fromJson(Map json) {
    return GameDetails(
     id: json['id'] ?? 0,
      title: json['title']  ?? 'No Title',
      thumbnail: json['thumbnail']  ?? '',
      shortDescription: json['short_description']  ?? 'https://previews.123rf.com/images/momoforsale/momoforsale2004/momoforsale200400053/144601971-no-game-sign-isolated-on-white-background-vector-illustration.jpg',
      genre: json['genre']  ?? 'No Genre',
      platform: json['platform']  ?? 'No Platform',
      publisher: json['publisher']  ?? 'No Publisher',
      developer: json['developer']  ?? 'No Developer',
      releaseDate: json['release_date']  ?? '0000-00',
      status: json['status']  ?? 'No Status',
      description: json['description']  ?? 'No Description',
    );
  }
}