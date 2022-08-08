import 'package:flash/pages/games/games_page.dart';
import 'package:flash/pages/welcome/welcome_page.dart';
import 'package:flash/widgets/sidebar/sidebar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:libadwaita_bitsdojo/libadwaita_bitsdojo.dart';

import 'cubit/main_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
        create: (context) => MainCubit(), child: _buildScaffold(context));
  }

  AdwScaffold _buildScaffold(BuildContext context) {
    return AdwScaffold(
      flap: (_) => _buildSidebar(context, currentIndex: 0),
      body: _buildViewStackUsingCubitState(),
      actions: AdwActions().bitsdojo,
    );
  }

  Widget _buildViewStackUsingCubitState() {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return AdwViewStack(
            index: state.index, children: _buildViewStackChildren());
      },
    );
  }

  List<Widget> _buildViewStackChildren() {
    return [const WelcomePage(), const GamesPage()];
  }
}

AdwSidebar _buildSidebar(BuildContext context, {required int currentIndex}) {
  var sidebarWidget = SidebarWidget(currentIndex: currentIndex, isDrawer: true);
  return sidebarWidget.build(context);
}
