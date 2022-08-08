import 'package:flash/l10n/l10n.dart';
import 'package:flash/widgets/transparent_divider/transparent_divider_widget.dart';
import 'package:flutter/material.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_buildTitle(context)],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(children: [
        Text(context.l10n.games, style: Theme.of(context).textTheme.headline1),
        const TransparentDivider(height: 10),
        Text(context.l10n.gamesPageDescription)
      ]),
    );
  }
}
