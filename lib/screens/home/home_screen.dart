import 'package:flutter/material.dart';
import 'search_delegate.dart';
import "package:movie_getter/config/app_config.dart";
import "package:movie_getter/data/movie.dart";

/**
 * Stateful home screen widget that will display a movie with details if clicked
 * (See `search_delegate.dart` to refer to the searching part)
*/
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Movie selectedMovie = Movie(title: "", imdbID: "", year: "", poster: "");

  // Displays a search bar for users to search movies
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

  /**
   * Creates the layout of the home screen;
   * If no movies are selected, it shows "Search Movies";
   * If a movie was selected, it shows the movie and details;
  */
  @override
  Widget build(BuildContext context) {
    // Widget that displays the body data
    Widget bodyWidget;

    // If no movies are selected, it shows "Search Movies";
    if (selectedMovie.title.isEmpty) {
      bodyWidget = const Center(
        child: Text(
          "Search Movies",
          style: Config.mainMsgStyle,
        ),
      );
    } else // Display the selected movie and its data
    {
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
            // To display the plot, we need to make an API call to another endpoint
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

    // Displays the appBar at the top and the bodyWidget in the center of the screen
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
