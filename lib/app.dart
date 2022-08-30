import 'package:adwaita/adwaita.dart';
import 'package:flash/pages/main/main_page.dart';
import 'package:flash/widgets/rounded_app/rounded_app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FlashApp extends StatelessWidget {
  const FlashApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedApp.withDefaultRadius(
      child: MaterialApp(
        title: "Flash",
        theme: AdwaitaThemeData.light(),
        darkTheme: AdwaitaThemeData.dark(),
        localizationsDelegates: const [AppLocalizations.delegate],
        supportedLocales: const [Locale("en")],
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
