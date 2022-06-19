import 'package:flutter/material.dart';
import 'package:sokoban/models/game_map.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  GameMap gameMap = GameMap("######\n#..P.#\n#C####\n#.####\n#X####\n######");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: gameMap.squaresNumber,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gameMap.rowNumber,
              ),
              itemBuilder: (BuildContext context, int index) {
                return gameMap.getWidget(index);
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.keyboard_arrow_up),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_left),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_right),
                      ),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_down)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
