import 'package:flutter/material.dart';

class TransparentDividerWidget extends StatelessWidget {
  final double height;
  const TransparentDividerWidget({Key? key, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.transparent,
      height: height,
    );
  }
}
