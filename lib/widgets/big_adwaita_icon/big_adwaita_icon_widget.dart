import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flutter/material.dart';

class BigAdwaitaIcon extends StatelessWidget {
  final String icon;

  const BigAdwaitaIcon(this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: 0.7,
        child: AdwaitaIcon(
          icon,
          size: 128,
        ));
  }
}
