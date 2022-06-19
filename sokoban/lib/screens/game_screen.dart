import 'package:flutter/material.dart';
import 'package:sokoban/screens/menu_screen.dart';

import '../models/game.dart';

class GameScreen extends StatefulWidget {
  final Game game;

  const GameScreen({Key? key, required this.game}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    Game game = widget.game;

    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 2, child: game.board.grid),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_up),
                  ),
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
                    TextButton(
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
                      child: const Text("Go home"),
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
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_down),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
