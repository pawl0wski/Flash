import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/utils/game_repository/models/game.dart';
import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';

class GamesGameTile extends StatelessWidget {
  final Game _game;
  final void Function() _deleteGame;

  const GamesGameTile(
      {required Game game, required void Function() deleteGame, Key? key})
      : _game = game,
        _deleteGame = deleteGame,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdwPreferencesGroup(children: [
      ExpansionTile(
        leading: const AdwaitaIcon(AdwaitaIcons.gamepad),
        title: Text(_game.name),
        subtitle: Text(_game.processName),
        textColor: Colors.white,
        iconColor: Colors.white,
        children: [_buildDeleteTile(context, onTap: _deleteGame)],
      )
    ]);
  }

  Widget _buildDeleteTile(BuildContext context,
      {required void Function() onTap}) {
    return ListTile(
      leading: const AdwaitaIcon(AdwaitaIcons.edit_delete),
      title: Text(context.l10n.deleteGame),
      onTap: onTap,
    );
  }
}
