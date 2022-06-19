import 'package:sokoban/models/directions.dart';
import 'package:sokoban/models/square.dart';

import 'coordinates.dart';

abstract class Movable extends Coordinates {
  final Square square;

  Movable(super.x, super.y, this.square);

  void move(Directions direction) {
    Coordinates newPosition = get(direction);
    x = newPosition.x;
    y = newPosition.y;
  }
}

class Player extends Movable {
  Player(int x, int y) : super(x, y, Square.player);
}

class Box extends Movable {
  Box(int x, int y) : super(x, y, Square.box);
}