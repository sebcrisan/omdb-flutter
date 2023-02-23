import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class Config {
  /**
   * Private map that stores configuration values from the config.json file
   * Just used for the API key here
  */
  static Map<String, dynamic> _apiKey = {};

  // Get the api key from config.json
  static Future<void> load() async {
    final file = File('config.json');
    final contents = await file.readAsString();
    _apiKey = json.decode(contents);
  }

  static String get apiKey => _apiKey['apiKey'];

  // Color palette configuration (TODO: Research usage of theme)
  static const Color primaryColor = Color.fromARGB(255, 11, 17, 36);
  static const Color secondaryColor = Color.fromARGB(255, 19, 37, 85);

  // Text style configuration for main messages in the center i.e. in home screen
  static const TextStyle mainMsgStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: 2.0,
    color: Colors.grey,
  );
}
