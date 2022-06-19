import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sokoban/models/game.dart';

class ApiService {

  static Future<List<Game>> fetchGames() async {
    final response = await http.get(Uri.parse(dotenv.env['API_ENDPOINT'].toString()));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<Game>games = [];
      for(var map in jsonDecode(response.body)) {
        games.add(Game.fromJson(map));
      }
      return games;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load games');
    }
  }

}