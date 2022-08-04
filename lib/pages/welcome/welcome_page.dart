import 'package:flash/l10n/l10n.dart';
import 'package:flash/widgets/transparent_divider/transparent_divider_widget.dart';
import 'package:flutter/material.dart';

import './widgets/welcome_icon_widget.dart';

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
          ..._getWelcomeIconWithBottomDivider(context),
          ..._getAppTitleWithBottomDivider(context),
          ..._getAppDescription(context)
        ],
      ),
    );
  }

  List<Widget> _getWelcomeIconWithBottomDivider(BuildContext context) {
    return const [
      WelcomeIconWidget(),
      TransparentDividerWidget(height: 25),
    ];
  }

  List<Widget> _getAppTitleWithBottomDivider(BuildContext context) {
    return [
      Text(
        context.l10n.welcomeTo(context.l10n.appTitle),
        style: Theme.of(context).textTheme.headline1,
      ),
      const TransparentDividerWidget(height: 15),
    ];
  }

  List<Widget> _getAppDescription(BuildContext context) {
    return [
      SizedBox(
          width: 300,
          child: Text(
            context.l10n.appDescription,
            textAlign: TextAlign.center,
          ))
    ];
  }
}
