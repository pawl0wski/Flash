import 'package:flutter/material.dart';

class TransparentDivider extends StatelessWidget {
  final double height;

  const TransparentDivider({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.transparent,
      height: height,
    );
  }
}
