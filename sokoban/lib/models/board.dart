import 'package:flutter/material.dart';
import 'package:sokoban/models/coordinates.dart';
import 'package:sokoban/models/square.dart';

class Board {
  final List<List<Square>> _board;

  Board.fromTemplate(String template) : _board = _parseTemplate(template);

  int get width => _board.length;

  int height(int index) => _board[index].length;

  Square get(Coordinates coordinates) => _board[coordinates.x][coordinates.y];

  void set(Coordinates coordinates, Square square) {
    _board[coordinates.x][coordinates.y] = square;
  }

  bool exist(Coordinates coordinates) =>
      coordinates.x >= 0 &&
      coordinates.y >= 0 &&
      coordinates.x < width &&
      coordinates.y < height(coordinates.x);

  List<Square> get toList {
    List<Square> list = [];

    for (List<Square> column in _board) {
      for (Square square in column) {
        list.add(square);
      }
    }

    return list;
  }

  GridView get grid {
    List<Square> boardList = toList;
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: boardList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _board.length,
      ),
      itemBuilder: (BuildContext context, int index) {
        return boardList[index].widget;
      },
    );
  }

  static List<List<Square>> _parseTemplate(String template) {
    List<String> rows = template.split("\n");
    List<List<Square>> board = [];

    for (int index = 0; index < rows.length; index++) {
      List<Square> column = [];
      for (String row in rows) {
        String symbol = row[index];
        Square square = Square.get(symbol);
        column.add(square);
      }
      board.add(column);
    }

    return board;
  }
}
