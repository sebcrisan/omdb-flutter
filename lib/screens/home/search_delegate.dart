import 'package:flutter/material.dart';
import 'package:movie_getter/data/movie.dart';
import "package:movie_getter/config/app_config.dart";

/**
 * Custom SearchDelegate class providing UI + functionality for searching movies
 */
class MovieSearchDelegate extends SearchDelegate<Movie> {
  // The text displayed in the search bar
  @override
  String get searchFieldLabel => "Search for movies...";

  // Displays the clear icon
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  // Displays the leading icon in the search bar which is a back arrow
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, Movie(imdbID: "", title: "", year: "", poster: ""));
      },
    );
  }

  /**
   * Displays the search results by calling `searchMovies` with the data entered
   * by the user and displays a list of movies that are returned.
  */
  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: searchMovies(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        // If data
        if (snapshot.hasData) {
          final movies = snapshot.data as List<Movie>;

          // If there are no movies, we show "No results found"
          if (movies.isEmpty) {
            return Container(
                color: Config.secondaryColor,
                child: const Center(
                  child: Text("No results found", style: Config.mainMsgStyle),
                ));
          }

          // If there are movies, show the list of movies
          return Container(
            padding: const EdgeInsets.only(top: 15),
            color: Config.secondaryColor,
            child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                // We have to use Material here else the hover won't work(?)
                return Material(
                  // The actual movie tile
                  child: ListTile(
                    tileColor: Config.secondaryColor,
                    textColor: Colors.white,
                    hoverColor: Config.primaryColor,
                    title: Text(movie.title),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(movie.poster),
                    ),
                    trailing: Text(movie.year),
                    onTap: () {
                      // Show home screen and pass selected movie
                      close(context, movie);
                    },
                  ),
                );
              },
            ),
          );
        }

        // If no data, we show an error message
        return const Center(child: Text('An error occurred'));
      },
    );
  }

  // Set build suggestions background color
  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(color: Config.secondaryColor);
  }

  // Custom appBar theme using the colors defined in the Config class
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(color: Config.primaryColor),
      hintColor: Colors.grey,
      textTheme: const TextTheme(
          titleLarge: TextStyle(
        color: Colors.white,
      )),
    );
  }
}
