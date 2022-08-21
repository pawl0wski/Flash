import 'package:flutter/widgets.dart';
import 'package:libadwaita/libadwaita.dart';

import '../flash_dialog.dart';

class PreviewDisplayDialog extends FlashDialog {
  @override
  Widget show(BuildContext context) {
    return GtkDialog(children: []);
  }
}
