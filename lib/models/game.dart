class Game {
   final int id;
  final String title;
  final String thumbnail;
  final String shortDescription;
  final String genre;
  final String platform;
  final String publisher;
  final String developer;
  final String releaseDate;

  Game({required this.id, required this.title, required this.thumbnail, required this.shortDescription, required this.genre, required this.platform, required this.publisher, required this.developer, required this.releaseDate});

   factory Game.fromJson(Map  json) {
    return Game(
      id: json['id'] ?? 0,
      title: json['title']  ?? 'No Title',
      thumbnail: json['thumbnail']  ?? '',
      shortDescription: json['short_description']  ?? 'https://previews.123rf.com/images/momoforsale/momoforsale2004/momoforsale200400053/144601971-no-game-sign-isolated-on-white-background-vector-illustration.jpg',
      genre: json['genre']  ?? 'No Genre',
      platform: json['platform']  ?? 'No Platform',
      publisher: json['publisher']  ?? 'No Publisher',
      developer: json['developer']  ?? 'No Developer',
      releaseDate: json['release_date']  ?? '0000-00',
    );
  }
}
