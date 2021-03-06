import 'package:sokoban/models/directions.dart';

class Coordinates {
  int x;
  int y;

  Coordinates(this.x, this.y);

  Coordinates get(Directions direction) {
    switch(direction) {
      case Directions.north:
        return Coordinates(x, y-1);
      case Directions.south:
        return Coordinates(x, y+1);
      case Directions.east:
        return Coordinates(x+1, y);
      case Directions.west:
        return Coordinates(x-1, y);
    }
  }
}
