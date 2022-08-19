import 'package:flash/widgets/big_adwaita_icon/big_adwaita_icon_widget.dart';
import 'package:flash/widgets/muted_text/muted_text_widget.dart';
import 'package:flash/widgets/transparent_divider/transparent_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';

class TitleWidget extends StatelessWidget {
  final bool showBigAdwaitaIcon;
  final String icon;
  final String title;
  final String description;
  final String? buttonText;
  final void Function()? onTap;

  const TitleWidget(
      {Key? key,
      required this.icon,
      required this.title,
      required this.description,
      this.showBigAdwaitaIcon = true,
      this.buttonText,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _buildBigAdwaitaIcon(),
      Text(title, style: Theme.of(context).textTheme.headline1),
      const TransparentDivider(height: 10),
      MutedText(
        description,
        textAlign: TextAlign.center,
      ),
      _buildButton(),
    ]);
  }

  Widget _buildBigAdwaitaIcon() {
    if (showBigAdwaitaIcon) {
      return BigAdwaitaIcon(icon);
    }
    return Container();
  }

  Widget _buildButton() {
    if (buttonText != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: AdwButton(
          opaque: true,
          backgroundColor: AdwDefaultColors.blue,
          onPressed: onTap,
          child: Text(buttonText!),
        ),
      );
    }
    return Container();
  }
}
