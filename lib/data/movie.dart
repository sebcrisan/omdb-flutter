import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config/app_config.dart';

/** 
 * A Movie class that contains data such as title, year, poster, plot (optional),
 * for a given movie, based on imdbID.
*/
class Movie {
  final String imdbID;
  final String title;
  final String year;
  final String poster;
  final String? plot;

  Movie(
      {required this.imdbID,
      required this.title,
      required this.year,
      required this.poster,
      this.plot});

  // Movie factory to convert json object to the data model
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      imdbID: json['imdbID'],
      title: json['Title'],
      year: json['Year'],
      poster: json['Poster'],
      plot: json['Plot'],
    );
  }
}

// Search movies given a movie title and returns a list of movies
Future<List<Movie>> searchMovies(String query) async {
  final apiKey = Config.apiKey;
  final url =
      Uri.parse('http://www.omdbapi.com/?apikey=$apiKey&s=$query&Type=movie');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);

    if (jsonData['Response'] == 'True') {
      final List<dynamic> searchResults = jsonData['Search'];

      final List<Movie> movies =
          searchResults.map((result) => Movie.fromJson(result)).toList();

      return movies;
    }
  }

  return [];
}

// Search a singular movie given an imdbID and returns a movie
Future<Movie> searchMovie(String imdbID) async {
  final apiKey = Config.apiKey;
  final url = Uri.parse('http://www.omdbapi.com/?apikey=$apiKey&i=$imdbID');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    if (jsonData['Response'] == 'True') {
      final Movie movie = Movie.fromJson(jsonData);
      return movie;
    }
  }

  return Movie(title: "", imdbID: "", year: "", poster: "", plot: "");
}
