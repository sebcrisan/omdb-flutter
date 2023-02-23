import 'package:flutter/material.dart';
import 'package:movie_getter/data/movie.dart';
import "package:movie_getter/config/app_config.dart";

class MovieSearchDelegate extends SearchDelegate<String> {
  @override
  String get searchFieldLabel => "Search for movies...";

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

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: searchMovies(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData) {
          final movies = snapshot.data as List<Movie>;

          if (movies.isEmpty) {
            return Container(
                color: Config.secondaryColor,
                child: const Center(
                  child: Text("No results found", style: Config.mainMsgStyle),
                ));
          }

          return Container(
            padding: const EdgeInsets.only(top: 15),
            color: Config.secondaryColor,
            child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Material(
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
                      // Return the selected movie
                      close(context, movie.imdbID);
                    },
                  ),
                );
              },
            ),
          );
        }

        return const Center(child: Text('An error occurred'));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(color: Config.secondaryColor);
  }

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
