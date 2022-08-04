import 'package:flash/pages/welcome/welcome_page.dart';
import 'package:flash/widgets/sidebar/sidebar_widget.dart';
import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:libadwaita_bitsdojo/libadwaita_bitsdojo.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdwScaffold(
      flap: (_) => _getSidebar(context, currentIndex: 0),
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

AdwSidebar _getSidebar(BuildContext context, {required int currentIndex}) {
  var sidebarWidget = SidebarWidget(currentIndex: currentIndex, isDrawer: true);
  return sidebarWidget.build(context);
}
