import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flutter/material.dart';

class WelcomeIconWidget extends StatelessWidget {
  const WelcomeIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Opacity(
        opacity: 0.7,
        child: AdwaitaIcon(
          AdwaitaIcons.sun,
          size: 128,
        ));
  }
}
