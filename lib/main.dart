import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void buttonPressed() {
    print("Button Pressed!");
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
