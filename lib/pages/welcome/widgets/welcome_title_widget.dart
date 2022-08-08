import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/widgets/big_adwaita_icon/big_adwaita_icon_widget.dart';
import 'package:flash/widgets/muted_text/muted_text_widget.dart';
import 'package:flash/widgets/transparent_divider/transparent_divider_widget.dart';
import 'package:flutter/material.dart';

class WelcomeTitleWidget extends StatelessWidget {
  const WelcomeTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ..._getWelcomeIconWithBottomDivider(context),
        ..._getAppTitleWithBottomDivider(context),
        ..._getAppDescription(context)
      ],
    );
  }

  List<Widget> _getWelcomeIconWithBottomDivider(BuildContext context) {
    return const [
      BigAdwaitaIcon(AdwaitaIcons.sun),
      TransparentDivider(height: 25),
    ];
  }

  List<Widget> _getAppTitleWithBottomDivider(BuildContext context) {
    return [
      Text(
        context.l10n.welcomeTo(context.l10n.appTitle),
        style: Theme.of(context).textTheme.headline1,
      ),
      const TransparentDivider(height: 15),
    ];
  }

  List<Widget> _getAppDescription(BuildContext context) {
    return [
      SizedBox(
          width: 300,
          child: MutedText(
            context.l10n.appDescription,
            textAlign: TextAlign.center,
          ))
    ];
  }
}
