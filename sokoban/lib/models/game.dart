import 'package:sokoban/models/board.dart';

class Game {
  final Board board;

  Game(String template) : board = Board.fromTemplate(template);

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(json['map']);
  }
}
