import 'package:flutter/material.dart';

class Wall extends StatelessWidget {
  const Wall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        color: Colors.blue,
      ),
    );
  }
}
