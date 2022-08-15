import 'package:flash/dialog/add_game_dialog/bloc/add_game_bloc.dart';
import 'package:flutter/material.dart';

class AddGameListener {
  const AddGameListener();

  listen(BuildContext context, AddGameState state) {
    if (state is AddGameStateClose) {
      Navigator.of(context).pop();
    }
  }
}
