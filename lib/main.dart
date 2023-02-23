import "package:flutter/material.dart";
import 'config/app_config.dart';
import "my_app.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config.load();
  runApp(const MyApp(key: Key("MyApp")));
}
