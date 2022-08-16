import 'package:flash/utils/game_repository/models/game.dart';
import 'package:flutter/material.dart';

import '../../bloc/games_bloc.dart';
import '../../widgets/games_game_tile_widget.dart';
import '../../widgets/games_list_with_title_widget.dart';
import '../../widgets/games_loading_widget.dart';
import '../games_event_adder/games_event_adder.dart';

class GamesPageBuilder {
  const GamesPageBuilder();

  Widget build(BuildContext context, GamesState state) {
    if (state is GamesStateLoaded) {
      return Scrollbar(
          child: ListView(children: [
        GamesListWithTitle(
            state: state,
            showAddGameDialog: _createEventsAdder(context).showAddGameDialog),
        ..._getGameTitles(state.games),
      ]));
    } else {
      return const GamesLoading();
    }
  }

  GamesEventsAdder _createEventsAdder(BuildContext context) {
    return GamesEventsAdder(context);
  }

  List<GamesGameTile> _getGameTitles(List<Game> games) {
    return games.map((Game game) => GamesGameTile(game: game)).toList();
  }
}
