import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flutter/widgets.dart';
import 'package:libadwaita/libadwaita.dart';

class SidebarButton extends StatelessWidget {
  final bool _isOpen;

  const SidebarButton({required bool isOpen, Key? key})
      : _isOpen = isOpen,
        super(key: key);

  @override
  AdwHeaderButton build(BuildContext context) {
    return AdwHeaderButton(icon: _getIcon());
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
