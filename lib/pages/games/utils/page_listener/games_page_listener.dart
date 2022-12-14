import 'package:flash/dialog/add_game_dialog/add_game_dialog.dart';
import 'package:flash/dialog/change_display_dialog/change_display_dialog.dart';
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
      _showEditNameDialog(context, game: state.gameToEdit);
    }
    if (state is GamesStateShowChangeDisplayDialog) {
      _showChangeDisplayDialog(context, game: state.gameToChangeDisplay);
    }
  }

  _emitLoadGamesEvent(BuildContext context) =>
      context.read<GamesBloc>().add(GamesEventLoadGames());

  _showAddGameDialog(BuildContext context) {
    var addGameDialog = AddGameDialog();
    addGameDialog.show(context).then((value) => _emitLoadGamesEvent(context));
  }

  _showEditNameDialog(BuildContext context, {required Game game}) {
    var editNameDialog = GameEditorDialog(game);
    editNameDialog.show(context).then((value) => _emitLoadGamesEvent(context));
  }

  _showChangeDisplayDialog(BuildContext context, {required Game game}) {
    var changeDisplayDialog = ChangeDisplayDialog(game: game);
    changeDisplayDialog
        .show(context)
        .then((value) => _emitLoadGamesEvent(context));
  }
}
