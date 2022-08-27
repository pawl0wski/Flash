import 'dart:io';

import 'package:flash/dialog/text_dialog/text_dialog.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/pages/displays/displays_page.dart';
import 'package:flash/pages/games/games_page.dart';
import 'package:flash/pages/settings/settings_page.dart';
import 'package:flash/pages/welcome/welcome_page.dart';
import 'package:flash/widgets/sidebar/sidebar_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:libadwaita_bitsdojo/libadwaita_bitsdojo.dart';

import 'bloc/main_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
        create: (context) =>
            MainBloc()..add(const MainEventCheckDependencies()),
        child: _buildScaffold(context));
  }

  Widget _buildScaffold(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {
        if (state is MainStateDependencyNotExist) {
          _showDependencyNotExistDialog(context, state);
        }
      },
      builder: (context, state) {
        if (state is MainStateUpdateIndex) {
          return AdwScaffold(
            title: Text(context.l10n.appTitle),
            flap: (_) => _buildSidebarUsingCubitState(context,
                currentIndex: state.index,
                onIndexChange: (int newIndex) => context
                    .read<MainBloc>()
                    .add(MainEventChangeIndex(newIndex + 1))),
            body: _buildViewStack(index: state.index),
            actions: AdwActions().bitsdojo,
          );
        }
        return Container();
      },
    );
  }

  Widget _buildViewStack({required int index}) {
    return AdwViewStack(index: index, children: _buildViewStackChildren());
  }

  List<Widget> _buildViewStackChildren() {
    return [
      const WelcomePage(),
      const GamesPage(),
      const DisplaysPage(),
      const SettingsPage()
    ];
  }

  AdwSidebar _buildSidebarUsingCubitState(BuildContext context,
      {required int currentIndex, required Function(int index) onIndexChange}) {
    return SidebarWidget(
      currentIndex: currentIndex - 1,
      // WelcomePage is first so we must decrement currentIndex
      onIndexChange: onIndexChange,
    ).build(context);
  }

  _showDependencyNotExistDialog(
      BuildContext context, MainStateDependencyNotExist state) {
    TextDialog(
            title: context.l10n.dependencyMissing,
            content: context.l10n.dependencyMissingInfo(state.dependency))
        .show(context)
        .then((_) => exit(1));
  }
}
