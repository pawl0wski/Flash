import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/widgets/big_adwaita_icon/big_adwaita_icon_widget.dart';
import 'package:flash/widgets/muted_text/muted_text_widget.dart';
import 'package:flash/widgets/transparent_divider/transparent_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';

class GamesTitle extends StatelessWidget {
  final bool isGamesEmpty;
  final Function onAddGame;

  const GamesTitle(
      {required this.isGamesEmpty, required this.onAddGame, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _getPaddingIfGamesIsNotEmpty(),
      child: Column(children: [
        _buildBigAdwaitaIconIfGamesIsEmpty(),
        Text(context.l10n.games, style: Theme.of(context).textTheme.headline1),
        const TransparentDivider(height: 10),
        MutedText(
          context.l10n.gamesPageDescription,
          textAlign: TextAlign.center,
        ),
        _buildAddGameButton(context),
      ]),
    );
  }

  EdgeInsets _getPaddingIfGamesIsNotEmpty() {
    return isGamesEmpty
        ? EdgeInsets.zero
        : const EdgeInsets.symmetric(vertical: 20);
  }

  Widget _buildBigAdwaitaIconIfGamesIsEmpty() {
    if (isGamesEmpty) {
      return const BigAdwaitaIcon(AdwaitaIcons.gamepad);
    }
    return Container(); // Empty container
  }

  Widget _buildAddGameButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: AdwButton(
        opaque: true,
        backgroundColor: AdwDefaultColors.blue,
        child: Text(context.l10n.addNewGame),
        onPressed: () => onAddGame(),
      ),
    );
  }
}
