import "package:flutter/material.dart";
import 'package:logger/logger.dart';

final Logger logger = Logger();

void main() => runApp(const MyApp(key: Key("MyApp")));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String appTitle = "Movie Getter";
  static const Color primaryColor = Color.fromARGB(255, 11, 17, 36);
  static const Color secondaryColor = Color.fromARGB(255, 19, 37, 85);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      key: Key("Movie Getter"),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  void buttonPressed() {
    logger.i('Button Pressed!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyApp.secondaryColor,
      appBar: AppBar(
        title: const Text(MyApp.appTitle),
        centerTitle: true,
        backgroundColor: MyApp.primaryColor,
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
        backgroundColor: MyApp.primaryColor,
        child: const Text("Click"),
      ),
    );
  }
}
