import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/utils/repository/models/game.dart';
import 'package:flash/widgets/expansion_title_without_color_change/expansion_tile_without_color_change_widget.dart';
import 'package:flash/widgets/muted_text/muted_text_widget.dart';
import 'package:flash/widgets/secondary_tile/secondary_tile.dart';
import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';

class GameTile extends StatelessWidget {
  final Game _game;
  final void Function() _deleteGame;
  final void Function() _editGameName;
  final void Function() _assignGame;

  const GameTile(
      {required Game game,
      required void Function() deleteGame,
      required void Function() editGameName,
      required void Function() assignGame,
      Key? key})
      : _game = game,
        _deleteGame = deleteGame,
        _editGameName = editGameName,
        _assignGame = assignGame,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdwPreferencesGroup(children: [
      ExpansionTileWithoutColorChange(
        leading: const AdwaitaIcon(AdwaitaIcons.gamepad),
        title: Text(_game.name),
        subtitle: MutedText(_game.processName),
        children: [
          _buildDisplayTile(context, onTap: _assignGame),
          _editNameTile(context, onTap: _editGameName),
          _buildDeleteTile(context, onTap: _deleteGame),
        ],
      )
    ]);
  }

  Widget _editNameTile(BuildContext context, {required void Function() onTap}) {
    return SecondaryTile(
      leading: const AdwaitaIcon(AdwaitaIcons.edit),
      title: Text(context.l10n.editName),
      onTap: onTap,
    );
  }

  Widget _buildDeleteTile(BuildContext context,
      {required void Function() onTap}) {
    return SecondaryTile(
      leading: const AdwaitaIcon(AdwaitaIcons.edit_delete),
      title: Text(context.l10n.deleteGame),
      onTap: onTap,
    );
  }

  Widget _buildDisplayTile(BuildContext context,
      {required void Function() onTap}) {
    var display = _game.getDisplay();
    var displayName = display == null
        ? context.l10n.assignDisplay
        : context.l10n.currentDisplay(display.name);
    return SecondaryTile(
        leading: const AdwaitaIcon(AdwaitaIcons.sun), title: Text(displayName));
  }
}
