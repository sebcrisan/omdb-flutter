import "package:flutter/material.dart";
import 'screens/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      key: Key("Movie Getter"),
      home: MyHomePage(),
    );
  }
}
