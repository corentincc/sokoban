import 'package:sokoban/models/board.dart';

class Game {
  final Board board;

  Game(String template) : board = Board.fromTemplate(template);
}
