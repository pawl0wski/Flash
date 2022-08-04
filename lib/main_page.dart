import 'package:flutter/material.dart';
import 'package:flash/pages/welcome_page/welcome_page.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:libadwaita_bitsdojo/libadwaita_bitsdojo.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdwScaffold(
      body: AdwViewStack(
        children: _getViewStackChildren(),
      ),
      actions: AdwActions().bitsdojo,
    );
  }

  List<Widget> _getViewStackChildren() {
    return [const WelcomePage()];
  }
}
