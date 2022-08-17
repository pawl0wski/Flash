import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flash/utils/game_repository/models/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:libadwaita/libadwaita.dart';

class GamesGameTile extends StatelessWidget {
  final Game _game;

  const GamesGameTile({required Game game, Key? key})
      : _game = game,
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
        children: [_buildDeleteTile()],
      )
    ]);
  }

  Widget _buildDeleteTile() {
    return const ListTile(
      leading: AdwaitaIcon(AdwaitaIcons.edit_delete),
      title: Text("Delete game"),
    );
  }
}
