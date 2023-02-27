# OMDB-Flutter

A flutter test project that enables users to search for movies. Retrieves searched movie data using the omdb api and serves it to the user. Please note that no tests have been written for the code yet. It also uses [dart:io](https://api.dart.dev/stable/2.19.2/dart-io/dart-io-library.html) so it will not run on browser based apps.

## Getting Started

### 1. Get your OMDB API Key

You can get your API key for the OMDB API at the [OMDB Website](https://www.omdbapi.com/apikey.aspx).

### 2. Create config.json

- Rename [`config.example.json`](./config.example.json) to `config.json`;
- Paste your API key in your renamed `config.json`.

### 3. Run the project

You can run the project using the following command:

```cmd
flutter run -d windows --release
```

<details>
  <summary>Note:</summary>
  As of right now, the project will not work for browser based apps.
</details>
