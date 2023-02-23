import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'search_delegate.dart';
import '../../my_app.dart';

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
      backgroundColor: MyApp.secondaryColor,
      appBar: AppBar(
        title: const Text(MyApp.appTitle),
        // centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => searchMovies(context),
            icon: const Icon(Icons.search),
          ),
        ],
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
    );
  }
}
