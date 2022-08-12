import 'package:flash/dialog/add_game_dialog/add_game_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/games_bloc.dart';
import 'utils/games_event_adder/games_event_adder.dart';
import 'widgets/games_list_with_title_widget.dart';
import 'widgets/games_loading_widget.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _initializeBloc(
      child: BlocConsumer<GamesBloc, GamesState>(
        buildWhen: (prev, current) => _stateShouldRebuild(current),
        listenWhen: (prev, current) => !_stateShouldRebuild(current),
        listener: _listen,
        builder: _builder,
      ),
    );
  }

  _listen(BuildContext context, GamesState state) {
    if (state is GamesStateShowAddGameDialog) {
      var dialog = AddGameDialog();
      showDialog(
          context: context,
          builder: (BuildContext context) => dialog.show(context));
    }
  }

  Widget _builder(BuildContext context, GamesState state) {
    if (state is GamesStateLoaded) {
      return GamesListWithTitle(
          state: state,
          showAddGameDialog: _createEventsAdder(context).showAddGameDialog);
    } else {
      return const GamesLoading();
    }
  }

  _initializeBloc({required Widget child}) {
    return BlocProvider(
        create: (context) => GamesBloc()..add(GamesEventLoadGames()),
        child: child);
  }

  _stateShouldRebuild(GamesState state) {
    return state is! GamesStateShowAddGameDialog;
  }

  GamesEventsAdder _createEventsAdder(BuildContext context) {
    return GamesEventsAdder(context);
  }
}
