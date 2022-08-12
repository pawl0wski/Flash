import 'package:flash/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';

import '../flash_dialog.dart';

class AddGameDialog extends FlashDialog {
  @override
  show(BuildContext context) {
    return GtkDialog(title: Text(context.l10n.addNewGame), children: []);
  }
}
