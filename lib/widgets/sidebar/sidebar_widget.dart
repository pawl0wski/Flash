import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:libadwaita/libadwaita.dart';

class SidebarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int newIndex)? onIndexChange;

  const SidebarWidget(
      {Key? key, required this.currentIndex, this.onIndexChange})
      : super(key: key);

  @override
  AdwSidebar build(BuildContext context) {
    return AdwSidebar(
        currentIndex: currentIndex,
        isDrawer: false,
        onSelected: onIndexChange ?? (index) => {},
        children: _getSidebarItems(context));
  }

  List<AdwSidebarItem> _getSidebarItems(BuildContext context) {
    return [
      _createSidebarItem(label: context.l10n.games, icon: AdwaitaIcons.gamepad),
      _createSidebarItem(label: context.l10n.displays, icon: AdwaitaIcons.sun),
      _createSidebarItem(
          label: context.l10n.settings, icon: AdwaitaIcons.settings),
    ];
  }

  AdwSidebarItem _createSidebarItem(
      {required String label, required String icon}) {
    return AdwSidebarItem(
        labelWidget: Row(
      children: [
        AdwaitaIcon(
          icon,
          size: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(label)
      ],
    ));
  }
}
