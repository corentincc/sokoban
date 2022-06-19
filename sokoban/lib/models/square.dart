import 'package:flutter/material.dart';
import 'package:sokoban/widgets/map/blank.dart';
import 'package:sokoban/widgets/map/box.dart';
import 'package:sokoban/widgets/map/destination.dart';
import 'package:sokoban/widgets/map/player.dart';
import 'package:sokoban/widgets/map/wall.dart';

class Square {
  static final List<Square> _list = [];

  static final Square wall = Square("#", const Wall());
  static final Square player = Square("P", const Player());
  static final Square box = Square("C", const Box());
  static final Square destination = Square("X", const Destination());
  static final Square empty = Square(".", const Blank());

  final String symbol;
  final Widget widget;

  Square(this.symbol, this.widget) {
    _list.add(this);
  }

  static void init() {
    Square.wall;
    Square.player;
    Square.box;
    Square.destination;
    Square.empty;
  }

  bool isEmpty() => this == empty;

  static Square get(String symbol) {
    Square.init();
    for (Square square in _list) {
      if (symbol == square.symbol) {
        return square;
      }
    }
    throw SquareNotFound("'$symbol' isn't a valid symbol.");
  }
}

class SquareNotFound implements Exception {
  final String cause;

  SquareNotFound(this.cause);
}
