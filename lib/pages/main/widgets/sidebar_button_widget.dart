import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flutter/widgets.dart';
import 'package:libadwaita/libadwaita.dart';

class SidebarButton extends StatelessWidget {
  final bool _isOpen;
  final Function() _onPressed;

  const SidebarButton(
      {required bool isOpen, required Function() onPressed, Key? key})
      : _onPressed = onPressed,
        _isOpen = isOpen,
        super(key: key);

  @override
  AdwHeaderButton build(BuildContext context) {
    return AdwHeaderButton(
      icon: _getIcon(),
      onPressed: _onPressed,
    );
  }

  Widget _getIcon() {
    var iconName =
        _isOpen ? AdwaitaIcons.sidebar_hide : AdwaitaIcons.sidebar_hide;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: AdwaitaIcon(
        iconName,
      ),
    );
  }
}
