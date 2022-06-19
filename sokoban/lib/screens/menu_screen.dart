import 'package:flutter/material.dart';
import 'package:sokoban/models/game.dart';
import 'package:sokoban/screens/game_screen.dart';
import 'package:sokoban/services/api_service.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late Future<List<Game>> _games;

  @override
  void initState() {
    super.initState();
    _games = ApiService.fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to sokoban !"),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FutureBuilder<List<Game>>(
                      future: _games,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return GameScreen(game: snapshot.data!.first);
                        }
                        if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.teal,
                onSurface: Colors.grey,
              ),
              child: const Text("Play"),
            ),
          ],
        ),
      ),
    );
  }
}
