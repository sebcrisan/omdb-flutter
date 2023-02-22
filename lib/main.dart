import "package:flutter/material.dart";
import 'package:logger/logger.dart';

final Logger logger = Logger();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String appTitle = "Movie Getter";
  static const Color primaryColor = Color.fromARGB(255, 11, 17, 36);

  void buttonPressed() {
    logger.i('Button Pressed!');
  }

  TextStyle getTextStyle() {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      letterSpacing: 2.0,
      color: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: const Key("Movie Getter"),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          centerTitle: true,
          backgroundColor: primaryColor,
        ),
        body: const Center(
          child: Text(
            "Hello",
            style: TextStyle(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: buttonPressed,
          backgroundColor: primaryColor,
          child: const Text("Click"),
        ),
      ),
    );
  }
}
