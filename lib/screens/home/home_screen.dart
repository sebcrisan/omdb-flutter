import 'package:flutter/material.dart';
import 'search_delegate.dart';
import "package:movie_getter/config/app_config.dart";
import "package:movie_getter/data/movie.dart";

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  // String selectedMovie = '';
  Movie selectedMovie = Movie(title: "", imdbID: "", year: "", poster: "");
  void searchMovies(BuildContext context) async {
    final result = await showSearch<Movie>(
      context: context,
      delegate: MovieSearchDelegate(),
    );

    if (result != null) {
      setState(() {
        selectedMovie = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyWidget;

    if (selectedMovie.title.isEmpty) {
      bodyWidget = const Center(
        child: Text(
          "Search Movies",
          style: Config.mainMsgStyle,
        ),
      );
    } else {
      bodyWidget = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectedMovie.title,
              style: Config.mainMsgStyle,
            ),
            const SizedBox(height: 20),
            Image.network(selectedMovie.poster),
            const SizedBox(height: 20),
            Text(
              selectedMovie.year,
              style: const TextStyle(color: Colors.white),
            ),
            FutureBuilder(
                future: searchMovie(selectedMovie.imdbID),
                builder: (context, movie) {
                  if (movie.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (movie.hasData) {
                    return Text(
                      "${movie.data?.plot}",
                      style: const TextStyle(color: Colors.white),
                    );
                  }
                  return const Text("No Plot");
                }),
          ],
        ),
      );
    }

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
      body: bodyWidget,
    );
  }
}
