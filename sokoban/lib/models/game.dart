import 'package:sokoban/models/board.dart';
import 'package:sokoban/models/directions.dart';
import 'package:sokoban/models/square.dart';
import 'package:sokoban/models/movable.dart';

import 'coordinates.dart';

class Game {
  final String _template;
  Board board;

  Game(this._template) : board = Board.fromTemplate(_template);

  void recreate() {
    board = Board.fromTemplate(_template);
  }

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(json['map']);
  }

  bool canMove(Movable movable, Directions direction) {
    Coordinates newPosition = movable.get(direction);

    if (!board.exist(newPosition)) {
      return false;
    }

    Square square = board.get(newPosition);
    return square == Square.empty || square == Square.destination;
  }

  bool isWin() {
    return board.toList.contains(Square.goodBox) && !board.toList.contains(Square.box);
  }

  void move(Movable movable, Directions direction) {
    moveBoxIfBox(movable, direction);
    
    if (!canMove(movable, direction)) {
      return;
    }

    Coordinates previousPosition = Coordinates(movable.x, movable.y);
    movable.move(direction);
    board.set(movable, movable.square);
    board.set(previousPosition, board.getEmpty(previousPosition));
  }

  void moveBoxIfBox(Movable movable, Directions direction) {
    Coordinates newPosition = movable.get(direction);

    if (board.get(newPosition) == Square.box || board.get(newPosition) == Square.goodBox) {
      Box box = Box(newPosition.x, newPosition.y);
      if (canMove(box, direction)) {
        board.set(box, board.getEmpty(box));
        box.move(direction);
        if(board.getEmpty(box) == Square.destination) {
          board.set(box, Square.goodBox);
        }
        else {
          board.set(box, box.square);
        }
      }
    }
  }

  Player get player {
    for (int x = 0; x < board.width; x++) {
      for (int y = 0; y < board.height; y++) {
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
