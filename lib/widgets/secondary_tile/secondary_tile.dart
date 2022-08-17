import 'package:adwaita/adwaita.dart';
import 'package:flutter/material.dart';

class SecondaryTile extends StatelessWidget {
  final color = AdwaitaColors.light4;
  final Widget leading;
  final Widget title;
  final void Function()? _onTap;

  const SecondaryTile(
      {required this.leading,
      required this.title,
      void Function()? onTap,
      Key? key})
      : _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title,
      onTap: _onTap,
      iconColor: color,
      textColor: color,
    );
  }
}
