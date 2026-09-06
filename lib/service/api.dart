import 'dart:convert';

import 'package:faisal_alanazi_proj2/models/game.dart';
import 'package:faisal_alanazi_proj2/models/game_details.dart';
import 'package:http/http.dart' as http;

class Api {
  static const String _baseUrl = 'https://www.freetogame.com/api';

  Future<List<Game>> getAllGames() async {
    final response = await http.get(Uri.parse('$_baseUrl/games'));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Game.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load games');
    }
  }
   Future<List<Game>> getGamesByPlatform(String platform) async{
    final response = await http.get(Uri.parse('$_baseUrl/games?platform=$platform'));

    if(response.statusCode == 200) {
      final List data = jsonDecode(response.body) ; 
      return data.map((e) => Game.fromJson(e),).toList() ; 

    }else{
      throw Exception('Failed to load games for platform') ; 
    }
   }
    Future<GameDetails> getGameDetails(int id) async {
      final response = await http.get(Uri.parse('$_baseUrl/game?id=$id'));

          if(response.statusCode == 200) {
      final  data = jsonDecode(response.body) ; 
      return GameDetails.fromJson(data); 

    }else{
      throw Exception('Failed to load details for game') ; 
    }
    }
}
