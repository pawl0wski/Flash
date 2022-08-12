import 'package:flash/dialog/add_game_dialog/add_game_dialog.dart';
import 'package:flash/pages/games/widgets/games_loading_widget.dart';
import 'package:flash/pages/games/widgets/games_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/games_bloc.dart';
import 'utils/games_event_adder/games_event_adder.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _initializeBloc(
      child: BlocConsumer<GamesBloc, GamesState>(
        buildWhen: (prev, current) => _stateShouldRebuild(current),
        listenWhen: (prev, current) => !_stateShouldRebuild(current),
        listener: _listenState,
        builder: (context, state) {
          if (state is GamesStateLoaded) {
            return _returnPageIfStateIsLoaded(context, state);
          } else {
            return const GamesLoading();
          }
        },
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

  _listenState(BuildContext context, GamesState state) {
    if (state is GamesStateShowAddGameDialog) {
      var dialog = AddGameDialog();
      showDialog(
          context: context,
          builder: (BuildContext context) => dialog.show(context));
    }
  }

  Widget _returnPageIfStateIsLoaded(
      BuildContext context, GamesStateLoaded state) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment:
          _getMainAxisAlignment(isGamesEmpty: state.isGamesEmpty),
      children: [_buildTitle(context, isGamesEmpty: state.isGamesEmpty)],
    );
  }

  MainAxisAlignment _getMainAxisAlignment({required bool isGamesEmpty}) {
    if (isGamesEmpty) {
      return MainAxisAlignment.center;
    }
    return MainAxisAlignment.start;
  }

  Widget _buildTitle(BuildContext context, {required bool isGamesEmpty}) {
    return GamesTitle(
      isGamesEmpty: isGamesEmpty,
      onAddGame: _createEventsAdder(context).showAddGameDialog,
    );
  }

  GamesEventsAdder _createEventsAdder(BuildContext context) {
    return GamesEventsAdder(context);
  }
}
