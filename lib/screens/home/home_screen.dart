import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'search_delegate.dart';
import "package:movie_getter/config/app_config.dart";

final Logger logger = Logger();

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  void searchMovies(BuildContext context) async {
    final result = await showSearch<String>(
      context: context,
      delegate: MovieSearchDelegate(),
    );

    if (result != null) {
      // Do something with the selected movie
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.secondaryColor,
      appBar: AppBar(
        actions: [
          const Spacer(),
          IconButton(
            onPressed: () => searchMovies(context),
            icon: const Icon(Icons.search),
          ),
          const Spacer(),
        ],
        backgroundColor: Config.primaryColor,
      ),
      body: const Center(
        child: Text(
          "Search Movies",
          style: Config.mainMsgStyle,
        ),
      ),
    );
  }
}
