import 'package:sokoban/models/directions.dart';

import 'coordinates.dart';

abstract class Movable extends Coordinates {
  Movable(super.x, super.y);

  void move(Directions direction) {
    Coordinates newPosition = get(direction);
    x = newPosition.x;
    y = newPosition.y;
  }
}

class Player extends Movable {
  Player(super.x, super.y);
}