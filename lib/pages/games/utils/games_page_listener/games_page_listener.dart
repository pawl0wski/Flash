import 'package:flash/dialog/add_game_dialog/add_game_dialog.dart';
import 'package:flutter/material.dart';

import '../../bloc/games_bloc.dart';

class GamesPageListener {
  const GamesPageListener();

  listen(BuildContext context, GamesState state) {
    if (state is GamesStateShowAddGameDialog) {
      _showAddGameDialog(context);
    }
  }

  _showAddGameDialog(BuildContext context) {
    var addGameDialog = AddGameDialog();
    showDialog(
        context: context,
        builder: (BuildContext context) => addGameDialog.show(context));
  }
}
