import 'package:flash/dialog/add_game_dialog/add_game_dialog.dart';
import 'package:flash/pages/games/utils/games_page_builder/games_page_builder.dart';
import 'package:flash/pages/games/utils/games_page_listener/games_page_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/games_bloc.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({Key? key}) : super(key: key);

  GamesPageBuilder get _builder => const GamesPageBuilder();

  GamesPageListener get _listener => const GamesPageListener();

  @override
  Widget build(BuildContext context) {
    return _initializeBloc(
      child: BlocConsumer<GamesBloc, GamesState>(
        buildWhen: (prev, current) => _stateShouldRebuild(current),
        listenWhen: (prev, current) => !_stateShouldRebuild(current),
        listener: _listener.listen,
        builder: _builder.build,
      ),
    );
  }

  _initializeBloc({required Widget child}) {
    return BlocProvider(
        create: (context) => GamesBloc()..add(GamesEventLoadGames()),
        child: child);
  }

  _stateShouldRebuild(GamesState state) {
    return state is! GamesStateShowAddGameDialog;
  }
}
