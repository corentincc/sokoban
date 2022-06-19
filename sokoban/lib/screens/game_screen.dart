import 'package:flutter/material.dart';
import 'package:sokoban/models/directions.dart';
import 'package:sokoban/screens/menu_screen.dart';
import 'package:sokoban/models/game.dart';
import 'package:sokoban/screens/win_screen.dart';

class GameScreen extends StatefulWidget {
  final Game game;
  final List<Game>? games;

  const GameScreen({Key? key, required this.game, required this.games}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    Game game = widget.game;
    List<Game>? games = widget.games;

    return Scaffold(
      body: !game.isWin() ? Column(
        children: [
          Expanded(flex: 2, child: game.board.grid),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: IconButton(
                    onPressed: () {
                      game.move(game.player, Directions.north);
                      setState(() { game = game; });
                    },
                    icon: const Icon(Icons.keyboard_arrow_up),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: IconButton(
                        onPressed: () {
                          game.move(game.player, Directions.west);
                          setState(() { game = game; });
                        },
                        icon: const Icon(Icons.keyboard_arrow_left),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MenuScreen(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.teal,
                        onSurface: Colors.grey,
                      ),
                      icon: const Icon(Icons.home),
                      label: const Text("Go home"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: IconButton(
                        onPressed: () {
                          game.move(game.player, Directions.east);
                          setState(() { game = game; });
                        },
                        icon: const Icon(Icons.keyboard_arrow_right),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: IconButton(
                    onPressed: () {
                      game.move(game.player, Directions.south);
                      setState(() { game = game; });
                    },
                    icon: const Icon(Icons.keyboard_arrow_down),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() { game = game.recreate; });
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.teal,
                    onSurface: Colors.grey,
                  ),
                  icon: const Icon(Icons.replay),
                  label: const Text("Play again"),
                ),
              ],
            ),
          ),
        ],
      ) : WinScreen(actualGame: game, games: games)
    );
  }
}
