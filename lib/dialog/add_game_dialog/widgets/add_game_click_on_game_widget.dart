import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/widgets/transparent_divider/transparent_divider_widget.dart';
import 'package:flutter/widgets.dart';

class AddGameClickOnGame extends StatelessWidget {
  const AddGameClickOnGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildGameIcon(context),
        _buildTransparentDivider(context),
        _buildDescription(context),
      ],
    );
  }

  Widget _buildGameIcon(BuildContext context) {
    return const AdwaitaIcon(
      AdwaitaIcons.list_add,
      size: 48,
    );
  }

  Widget _buildTransparentDivider(BuildContext context) {
    return const TransparentDivider(height: 20);
  }

  Widget _buildDescription(BuildContext context) {
    return SizedBox(
      child: Text(
        context.l10n.clickOnTheGame,
        textAlign: TextAlign.center,
      ),
    );
  }
}
