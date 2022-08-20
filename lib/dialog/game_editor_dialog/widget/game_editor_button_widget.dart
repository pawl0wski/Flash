import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:libadwaita/libadwaita.dart';

class GameEditorButton extends StatelessWidget {
  final String text;
  final bool mainButton;
  final void Function() _onClick;

  const GameEditorButton(
      {required this.text,
      this.mainButton = false,
      required void Function() onClick,
      Key? key})
      : _onClick = onClick,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AdwButton(
        opaque: mainButton,
        backgroundColor: mainButton ? AdwDefaultColors.blue : null,
        onPressed: _onClick,
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
