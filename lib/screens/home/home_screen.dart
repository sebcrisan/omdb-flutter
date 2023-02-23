import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'search_delegate.dart';
import "package:movie_getter/config/app_config.dart";
import "package:movie_getter/data/movie.dart";

final Logger logger = Logger();

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
      // Do something with the selected movie
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
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(
              'Plot: "This is the plot',
              style: TextStyle(color: Colors.white),
            ),
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
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(
      //         "Movie Title",
      //         style: Config.mainMsgStyle,
      //       ),
      //       const SizedBox(height: 20),
      //       Image.network(
      //           "https://m.media-amazon.com/images/M/MV5BMjE0NDQ0Mzg2Nl5BMl5BanBnXkFtZTcwNTcwMzEwMg@@._V1_SX300.jpg"),
      //       const SizedBox(height: 20),
      //       Text(
      //         'Year: 1994',
      //         style: TextStyle(color: Colors.white),
      //       ),
      //       const SizedBox(height: 20),
      //       Text(
      //         'Plot: "This is the plot',
      //         style: TextStyle(color: Colors.white),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
