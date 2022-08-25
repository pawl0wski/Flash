import 'package:flash/l10n/l10n.dart';
import 'package:flash/widgets/transparent_divider/transparent_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';

import '../flash_dialog.dart';

class TextDialog extends FlashDialog {
  final String title;
  final String content;

  TextDialog({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return GtkDialog(
      title: Text(title),
      children: [
        Text(content),
        const TransparentDivider(
          height: 15,
        ),
        _buildCloseButton(context),
      ],
    );
  }

  _buildCloseButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AdwButton(
          child: Text(context.l10n.close),
        )
      ],
    );
  }
}
