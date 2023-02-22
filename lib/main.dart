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
        ),
        body: const Center(
          child: Text("Hello"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: buttonPressed,
          child: const Text("Click"),
        ),
      ),
    );
  }
}
