import 'package:flash/l10n/l10n.dart';
import 'package:flash/pages/displays/displays_page.dart';
import 'package:flash/pages/games/games_page.dart';
import 'package:flash/pages/welcome/welcome_page.dart';
import 'package:flash/widgets/sidebar/sidebar_widget.dart';
import 'package:flutter/widgets.dart';
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

  Widget _buildScaffold(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return AdwScaffold(
          title: Text(context.l10n.appTitle),
          flap: (_) => _buildSidebarUsingCubitState(context,
              currentIndex: state.index,
              onIndexChange: context.read<MainCubit>().setPage),
          body: _buildViewStack(index: state.index),
          actions: AdwActions().bitsdojo,
        );
      },
    );
  }

  Widget _buildViewStack({required int index}) {
    return AdwViewStack(index: index, children: _buildViewStackChildren());
  }

  List<Widget> _buildViewStackChildren() {
    return [const WelcomePage(), const GamesPage(), const DisplaysPage()];
  }
}

AdwSidebar _buildSidebarUsingCubitState(BuildContext context,
    {required int currentIndex, required Function(int index) onIndexChange}) {
  return SidebarWidget(
    currentIndex: currentIndex - 1,
    // WelcomePage is first so we must decrement currentIndex
    onIndexChange: onIndexChange,
  ).build(context);
}
