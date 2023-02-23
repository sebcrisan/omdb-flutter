import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config/app_config.dart';

class Movie {
  final String imdbID;
  final String title;
  final String year;
  final String poster;

  Movie({
    required this.imdbID,
    required this.title,
    required this.year,
    required this.poster,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      imdbID: json['imdbID'],
      title: json['Title'],
      year: json['Year'],
      poster: json['Poster'],
    );
  }
}

Future<List<Movie>> searchMovies(String query) async {
  final apiKey = Config.apiKey;
  final url = Uri.parse('http://www.omdbapi.com/?apikey=$apiKey&s=$query');

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
