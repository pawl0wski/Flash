import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/utils/game_repository/models/game.dart';
import 'package:flash/widgets/muted_text/muted_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';

class GamesGameTile extends StatelessWidget {
  final Game _game;
  final void Function() _deleteGame;
  final void Function() _editGameName;

  const GamesGameTile(
      {required Game game,
      required void Function() deleteGame,
      required void Function() editGameName,
      Key? key})
      : _game = game,
        _deleteGame = deleteGame,
        _editGameName = editGameName,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdwPreferencesGroup(children: [
      ExpansionTile(
        leading: const AdwaitaIcon(AdwaitaIcons.gamepad),
        title: Text(_game.name),
        subtitle: MutedText(_game.processName),
        textColor: Colors.white,
        iconColor: Colors.white,
        children: [
          _editNameTile(context, onTap: _editGameName),
          _buildDeleteTile(context, onTap: _deleteGame)
        ],
      )
    ]);
  }

  Widget _editNameTile(BuildContext context, {required void Function() onTap}) {
    return ListTile(
      leading: const AdwaitaIcon(AdwaitaIcons.edit),
      title: Text(context.l10n.editName),
      onTap: onTap,
    );
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
