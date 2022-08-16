import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flash/utils/game_repository/models/game.dart';
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
      AdwActionRow(
        start: const AdwaitaIcon(AdwaitaIcons.gamepad),
        title: _game.name,
        subtitle: _game.processName,
      )
    ]);
  }
}
