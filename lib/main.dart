import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: const Key("Movie Getter"),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Movie Getter"),
        ),
      ),
    );
  }
}
