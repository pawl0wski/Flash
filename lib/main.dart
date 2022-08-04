import 'package:adwaita/adwaita.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const GameContrastBoosterApp());
}

class GameContrastBoosterApp extends StatelessWidget {
  const GameContrastBoosterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AdwaitaThemeData.light(),
      darkTheme: AdwaitaThemeData.dark(),
      themeMode: ThemeMode.system,
    );
  }
}
