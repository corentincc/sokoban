import 'package:flutter/material.dart';
import 'package:sokoban/models/coordinates.dart';
import 'package:sokoban/models/square.dart';

class Board {
  final List<List<Square>> _board;
  final List<List<Square>> _emptyBoard;
  
  Board.fromTemplate(String template) : _board = _parseTemplate(template), _emptyBoard = _emptyParseTemplate(template);

  int get width => _board.length;

  int get height => _board[0].length;

  Square get(Coordinates coordinates) => _board[coordinates.x][coordinates.y];
  Square getEmpty(Coordinates coordinates) => _emptyBoard[coordinates.x][coordinates.y];

  void set(Coordinates coordinates, Square square) {
    _board[coordinates.x][coordinates.y] = square;
  }

  bool exist(Coordinates coordinates) =>
      coordinates.x >= 0 &&
      coordinates.y >= 0 &&
      coordinates.x < width &&
      coordinates.y < height;

  List<Square> get toList {
    List<Square> list = [];

    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        Coordinates coordinates = Coordinates(x, y);
        list.add(get(coordinates));
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
        crossAxisCount: height,
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

  static List<List<Square>> _emptyParseTemplate(String template) {
    List<String> rows = template.split("\n");
    List<List<Square>> board = [];

    for (int index = 0; index < rows.length; index++) {
      List<Square> column = [];
      for (String row in rows) {
        String symbol = row[index];
        Square square = Square.getEmpty(symbol);
        column.add(square);
      }
      board.add(column);
    }

    return board;
  }
}
