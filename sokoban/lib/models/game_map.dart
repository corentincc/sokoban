import 'package:sokoban/widgets/map/blank.dart';
import 'package:sokoban/widgets/map/wall.dart';

class GameMap {
  String gameMap;
  String transformedGameMap = "";
  int rowNumber = 0;
  int columnNumber = 0;
  int squaresNumber = 0;

  GameMap(this.gameMap) {
    rowNumber = _getRowNumber(gameMap);
    columnNumber = _getColumnNumber(gameMap);
    squaresNumber = rowNumber * columnNumber;
    transformedGameMap = gameMap.replaceAll("\n", "");
  }

  getWidget(int index) {
    if(_isWall(index)) {
      return const Wall();
    }
    else {
      return const Blank();
    }
  }

  _isWall(int index) {
    return transformedGameMap[index] == "#";
  }

  _getRowNumber(String gameMap) {
    int newRowNumber = 0;
    for (var i = 0; i < gameMap.length; i++) {
      if (gameMap[i].contains("\n")) {
        return newRowNumber;
      } else {
        newRowNumber += 1;
      }
    }
  }

  _getColumnNumber(String gameMap) {
    int newColumnNumber = 0;
    for (var i = 0; i < gameMap.length; i++) {
      if (gameMap[i].contains("\n")) {
        newColumnNumber += 1;
      }
    }
    return newColumnNumber+1;
  }
}
