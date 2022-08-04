import 'package:flutter/material.dart';

class WelcomeIconWidget extends StatelessWidget {
  const WelcomeIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Opacity(
        opacity: 0.7,
        child: Icon(
          Icons.flare_sharp,
          size: 128,
        ));
  }
}
