import 'dart:convert';
import 'dart:io';

class Config {
  static Map<String, dynamic> _config = {};

  static Future<void> load() async {
    final file = File('config.json');
    final contents = await file.readAsString();
    _config = json.decode(contents);
  }

  static String get apiKey => _config['apiKey'];
}
