import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/widgets/big_adwaita_icon/big_adwaita_icon_widget.dart';
import 'package:flash/widgets/transparent_divider/transparent_divider_widget.dart';
import 'package:flutter/material.dart';

class GamesTitle extends StatelessWidget {
  final bool isGamesEmpty;

  const GamesTitle({required this.isGamesEmpty, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _getPaddingIfGamesIsNotEmpty(),
      child: Column(children: [
        _buildBigAdwaitaIconIfGamesIsEmpty(),
        Text(context.l10n.games, style: Theme.of(context).textTheme.headline1),
        const TransparentDivider(height: 10),
        Text(context.l10n.gamesPageDescription)
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
}
