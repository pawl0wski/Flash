import 'package:flutter/material.dart';

class ExpansionTileWithoutColorChange extends StatelessWidget {
  final List<Widget> children;
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;

  const ExpansionTileWithoutColorChange({
    required this.children,
    this.leading,
    required this.title,
    this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: leading,
      title: title,
      subtitle: subtitle,
      textColor: Colors.white,
      iconColor: Colors.white,
      children: children,
    );
  }
}
