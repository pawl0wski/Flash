import 'package:flash/pages/games/bloc/games_bloc.dart';
import 'package:flutter/material.dart';

import 'games_title_widget.dart';

class GamesListWithTitle extends StatelessWidget {
  final GamesStateLoaded state;
  final Function showAddGameDialog;

  const GamesListWithTitle(
      {required this.state, required this.showAddGameDialog, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      onAddGame: showAddGameDialog,
    );
  }
}
