import 'package:flutter/material.dart';
import 'package:movie_getter/movie.dart';

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
            return const Center(child: Text('No results found'));
          }

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];

              return ListTile(
                title: Text(movie.title),
                onTap: () {
                  // Return the selected movie
                  close(context, movie.imdbID);
                },
              );
            },
          );
        }

        return const Center(child: Text('An error occurred'));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
