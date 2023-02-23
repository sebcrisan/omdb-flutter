import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

class Config {
  static Map<String, dynamic> _config = {};

  static Future<void> load() async {
    final file = File('config.json');
    final contents = await file.readAsString();
    _config = json.decode(contents);
  }

  static String get apiKey => _config['apiKey'];

  static const Color primaryColor = Color.fromARGB(255, 11, 17, 36);
  static const Color secondaryColor = Color.fromARGB(255, 19, 37, 85);
}
