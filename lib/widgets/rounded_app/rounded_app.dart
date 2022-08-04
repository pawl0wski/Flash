import 'package:flutter/material.dart';

class RoundedApp extends StatelessWidget {
  final Widget child;
  final Radius radius;

  const RoundedApp({required this.child, required this.radius, Key? key})
      : super(key: key);

  static RoundedApp withDefaultRadius({required Widget child}) {
    const defaultRadius = Radius.circular(15);
    return RoundedApp(
      radius: defaultRadius,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(radius),
      child: child,
    );
  }
}
