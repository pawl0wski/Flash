import 'package:flutter/material.dart';

class MutedText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;

  const MutedText(this.text, {this.textAlign = TextAlign.start, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Text(
        text,
        textAlign: textAlign,
      ),
    );
  }
}
