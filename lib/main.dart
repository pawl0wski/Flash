import 'package:adwaita/adwaita.dart';
import 'package:flutter/material.dart';
import 'package:flash/main_page.dart';
import 'package:flash/widgets/rounded_app/rounded_app_widget.dart';

void main() {
  runApp(const FlashApp());
}

class FlashApp extends StatelessWidget {
  const FlashApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedApp.withDefaultRadius(
      child: MaterialApp(
        title: "Flash",
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
