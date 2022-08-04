import 'package:flutter/material.dart';
import 'package:gamecontrastbooster/pages/welcome_page/widgets/welcome_icon_widget.dart';
import 'package:gamecontrastbooster/widgets/transparent_divider/transparent_divider_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const WelcomeIconWidget(),
          TransparentDividerWidget(height: 25)
        ],
      ),
    );
  }
}
