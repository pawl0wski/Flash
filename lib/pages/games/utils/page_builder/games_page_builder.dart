import 'package:flash/utils/repository/models/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libadwaita/libadwaita.dart';

import '../../../../widgets/loading_widget/loading_widget.dart';
import '../../bloc/games_bloc.dart';
import '../../widgets/column_with_game_title_widget.dart';
import '../../widgets/game_tile_widget.dart';
import '../event_adder/games_event_adder.dart';

class GamesPageBuilder {
  const GamesPageBuilder();

  Widget build(BuildContext context, GamesState state) {
    if (state is GamesStateLoaded) {
      return _buildColumnIfGamesIsNotEmpty(
        context,
        games: state.games,
        child: ColumnWithGameTitle(
            state: state,
            showAddGameDialog: _createEventsAdder(context).showAddGameDialog),
      );
    } else {
      return const Loading();
    }
  }

  Widget _buildColumnIfGamesIsNotEmpty(BuildContext context,
      {required Widget child, required List<Game> games}) {
    if (games.isNotEmpty) {
      return AdwClamp.scrollable(
          child: Column(children: [
        child,
        ..._getGameTitles(context, games: games),
      ]));
    }
    return Center(child: child);
  }

  GamesEventsAdder _createEventsAdder(BuildContext context) {
    return GamesEventsAdder(context);
  }

  List<GameTile> _getGameTitles(BuildContext context,
      {required List<Game> games}) {
    return games
        .map((Game game) => GameTile(
              game: game,
              deleteGame: () =>
                  context.read<GamesBloc>().add(GamesBlocEventDeleteGame(game)),
              editGameName: () => context
                  .read<GamesBloc>()
                  .add(GamesBlocEventEditGameName(game)),
            ))
        .toList();
  }
}
