import 'package:flash/dialog/add_game_dialog/add_game_dialog.dart';
import 'package:flash/dialog/game_editor_dialog/game_editor_dialog.dart';
import 'package:flash/utils/repository/models/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/games_bloc.dart';

class GamesPageListener {
  const GamesPageListener();

  listen(BuildContext context, GamesState state) {
    if (state is GamesStateShowAddGameDialog) {
      _showAddGameDialog(context);
    }
    if (state is GamesStateShowEditNameDialog) {
      _showEditNameDialog(context, game: state.game);
    }
  }

  _showAddGameDialog(BuildContext context) {
    var addGameDialog = AddGameDialog();
    showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => addGameDialog.show(context))
        .then((value) => context.read<GamesBloc>().add(GamesEventLoadGames()));
  }

  _showEditNameDialog(BuildContext context, {required Game game}) {
    var editNameDialog = GameEditorDialog(game);
    showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) => editNameDialog.show(context))
        .then((value) => context.read<GamesBloc>().add(GamesEventLoadGames()));
  }
}
