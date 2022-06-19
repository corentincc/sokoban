import 'package:flutter/material.dart';
import 'package:sokoban/models/game.dart';
import 'package:sokoban/screens/game_screen.dart';
import 'package:sokoban/screens/menu_screen.dart';

class WinScreen extends StatefulWidget {
  final Game actualGame;
  final List<Game>? games;

  const WinScreen({Key? key, required this.actualGame, required this.games}) : super(key: key);

  @override
  State<WinScreen> createState() => _WinScreenState();
}

class _WinScreenState extends State<WinScreen> {

  @override
  Widget build(BuildContext context) {
    Game actualGame = widget.actualGame;
    List<Game>? games = widget.games;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Congratulation !"),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => newGameScreen(actualGame,games)),
                );
              },
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.teal,
                onSurface: Colors.grey,
              ),
              icon: const Icon(Icons.play_arrow),
              label: const Text("Next map"),
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
              label: const Text("Home"),
            ),
          ],
        ),
      ),
    );
  }

  Widget newGameScreen(Game actualGame, List<Game>? games) {
    if (games!.length > games.indexOf(actualGame)+1) {
      return GameScreen(game: games.elementAt(games.indexOf(actualGame)+1), games: games);
    }
    else {
      return const MenuScreen();
    }
  }
}
