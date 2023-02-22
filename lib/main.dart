import "package:flutter/material.dart";
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

final Logger logger = Logger();

void main() => runApp(const MyApp(key: Key("MyApp")));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String appTitle = "Movie Getter";
  static const Color primaryColor = Color.fromARGB(255, 11, 17, 36);
  static const Color secondaryColor = Color.fromARGB(255, 19, 37, 85);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      key: Key("Movie Getter"),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  void buttonPressed() {
    logger.i('Button Pressed!');
  }

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
      floatingActionButton: FloatingActionButton(
        onPressed: buttonPressed,
        backgroundColor: MyApp.primaryColor,
        child: const Text("Click"),
      ),
    );
  }
}

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
      future: searchMovies(query), // TODO: Implement searchMovies
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData) {
          final movies = snapshot.data as List<Movie>;

          if (movies.isEmpty) {
            return Center(child: Text('No results found'));
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

        return Center(child: Text('An error occurred'));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

Future<List<Movie>> searchMovies(String query) async {
  logger.i("Searching for: $query");
  Movie testMovie = Movie();
  return [testMovie];
}

class Movie {
  String title = "Test Title";
  String imdbID = "tt201538";
}
