import 'package:adwaita/adwaita.dart';
import 'package:flutter/material.dart';

class MutedText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;

  const MutedText(this.text, {this.textAlign = TextAlign.start, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: const TextStyle(color: AdwaitaColors.light5),
    );
  }
}
