import 'package:adwaita/adwaita.dart';
import 'package:flutter/material.dart';
import 'package:gamecontrastbooster/pages/welcome_page.dart';
import 'package:gamecontrastbooster/widgets/add_radius/rounded_app.dart';

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
    return const WelcomePage();
  }
}
