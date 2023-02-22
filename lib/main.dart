import "package:flutter/material.dart";
import 'package:logger/logger.dart';

final Logger logger = Logger();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void buttonPressed() {
    logger.i('Button Pressed!');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: const Key("Movie Getter"),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Movie Getter"),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 11, 17, 36),
        ),
        body: const Center(
          child: Text(
            "Hello",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.grey,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: buttonPressed,
          backgroundColor: Color.fromARGB(255, 11, 17, 36),
          child: const Text("Click"),
        ),
      ),
    );
  }
}
