import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/pages/games/bloc/games_bloc.dart';
import 'package:flash/utils/repository/models/game.dart';
import 'package:flash/widgets/title_widget/title_widget.dart';
import 'package:flutter/material.dart';

class ColumnWithGameTitle extends StatelessWidget {
  final GamesStateLoaded state;
  final Function showAddGameDialog;

  const ColumnWithGameTitle(
      {required this.state, required this.showAddGameDialog, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment:
          _getMainAxisAlignment(isGamesEmpty: state.isGamesEmpty),
      children: [
        _buildTitle(context,
            isGamesEmpty: state.isGamesEmpty, games: state.games)
      ],
    );
  }

  MainAxisAlignment _getMainAxisAlignment({required bool isGamesEmpty}) {
    if (isGamesEmpty) {
      return MainAxisAlignment.center;
    }
    return MainAxisAlignment.start;
  }

  Widget _buildTitle(BuildContext context,
      {required bool isGamesEmpty, required List<Game> games}) {
    return TitleWidget(
      showBigAdwaitaIcon: games.isEmpty,
      icon: AdwaitaIcons.applications_games,
      title: context.l10n.games,
      description: context.l10n.gamesPageDescription,
      buttonText: context.l10n.addNewGame,
      onTap: () => showAddGameDialog(),
    );
  }
}
