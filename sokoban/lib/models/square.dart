import 'package:flutter/material.dart';
import 'package:sokoban/widgets/image_container.dart';

class Square {
  static final List<Square> _list = [];

  static final Square wall = Square("#", const ImageContainer(imagePath: "assets/sprites/wall.png"));
  static final Square player = Square("P", const ImageContainer(imagePath: "assets/sprites/player.png"));
  static final Square box = Square("C", const ImageContainer(imagePath: "assets/sprites/box.png"));
  static final Square destination = Square("X", const ImageContainer(imagePath: "assets/sprites/destination.png"));
  static final Square empty = Square(".", const ImageContainer(imagePath: "assets/sprites/floor.png"));

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
