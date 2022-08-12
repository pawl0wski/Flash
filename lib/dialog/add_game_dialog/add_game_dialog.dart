import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/widgets/transparent_divider/transparent_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';

import '../flash_dialog.dart';

class AddGameDialog extends FlashDialog {
  @override
  show(BuildContext context) {
    return GtkDialog(
        title: Text(context.l10n.addNewGame),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        children: [
          _buildGameIcon(context),
          _buildTransparentDivider(context),
          _buildDescription(context),
        ]);
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
