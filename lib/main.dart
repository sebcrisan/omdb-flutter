import "package:flutter/material.dart";
import 'config/app_config.dart';
import "my_app.dart";

// Main function
void main() async {
  // Ensure that Flutter is initialized and ready to use
  WidgetsFlutterBinding.ensureInitialized();

  // Load the app configuration from disk
  await Config.load();

  // Start the flutter application and runs MyApp
  runApp(const MyApp(key: Key("MyApp")));
}
