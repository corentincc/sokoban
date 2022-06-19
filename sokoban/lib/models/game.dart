import 'package:sokoban/models/board.dart';
import 'package:sokoban/models/directions.dart';
import 'package:sokoban/models/square.dart';
import 'package:sokoban/models/movable.dart';

import 'coordinates.dart';

class Game {
  final Board board;

  Game(String template) : board = Board.fromTemplate(template);

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(json['map']);
  }

  bool canMove(Movable movable, Directions direction) {
    Coordinates newPosition = movable.get(direction);

    if (!board.exist(newPosition)) {
      return false;
    }

    Square square = board.get(newPosition);
    return square == Square.empty;
  }

  void move(Movable movable, Directions direction) {
    if (!canMove(movable, direction)) {
      return;
    }

    movable.move(direction);
  }

  Player findPlayer() {
    for (int x = 0; x < board.width; x++) {
      for (int y = 0; y < board.height(x); y++) {
        Square square = board.get(Coordinates(x, y));
        if (square == Square.player) {
          return Player(x, y);
        }
      }
    }
    throw PlayerNotFound("Player not found in the board.");
  }
}

class PlayerNotFound implements Exception {
  final String cause;

  PlayerNotFound(this.cause);
}
