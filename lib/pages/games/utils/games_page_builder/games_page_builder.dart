import 'package:flash/utils/repository/models/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libadwaita/libadwaita.dart';

import '../../bloc/games_bloc.dart';
import '../../widgets/games_game_tile_widget.dart';
import '../../widgets/games_list_with_title_widget.dart';
import '../../widgets/games_loading_widget.dart';
import '../games_event_adder/games_event_adder.dart';

class GamesPageBuilder {
  const GamesPageBuilder();

  Widget build(BuildContext context, GamesState state) {
    if (state is GamesStateLoaded) {
      return _buildColumnIfGamesIsNotEmpty(
        context,
        games: state.games,
        child: GamesListWithTitle(
            state: state,
            showAddGameDialog: _createEventsAdder(context).showAddGameDialog),
      );
    } else {
      return const GamesLoading();
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

  List<GamesGameTile> _getGameTitles(BuildContext context,
      {required List<Game> games}) {
    return games
        .map((Game game) => GamesGameTile(
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
