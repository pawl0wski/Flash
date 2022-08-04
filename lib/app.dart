import 'package:adwaita/adwaita.dart';
import 'package:flutter/material.dart';

import 'main_page.dart';
import 'widgets/rounded_app/rounded_app_widget.dart';

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
