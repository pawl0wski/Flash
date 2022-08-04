import 'package:adwaita/adwaita.dart';
import 'package:flutter/material.dart';
import 'package:gamecontrastbooster/main_page.dart';
import 'package:gamecontrastbooster/widgets/rounded_app/rounded_app_widget.dart';

void main() {
  runApp(const GameContrastBoosterApp());
}

class GameContrastBoosterApp extends StatelessWidget {
  const GameContrastBoosterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedApp.withDefaultRadius(
      child: MaterialApp(
        theme: AdwaitaThemeData.light(),
        darkTheme: AdwaitaThemeData.dark(),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        home: _getHome(),
      ),
    );
  }

  Widget _getHome() {
    return const MainPage();
  }
}
