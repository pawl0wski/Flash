import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';

class SidebarWidget extends StatelessWidget {
  final int currentIndex;
  final bool isDrawer;

  const SidebarWidget(
      {Key? key, required this.currentIndex, required this.isDrawer})
      : super(key: key);

  @override
  AdwSidebar build(BuildContext context) {
    return AdwSidebar(
        currentIndex: currentIndex,
        isDrawer: isDrawer,
        onSelected: (index) => {},
        children: _getSidebarItems(context));
  }

  List<AdwSidebarItem> _getSidebarItems(BuildContext context) {
    return [
      _createSidebarItem(label: context.l10n.games, icon: AdwaitaIcons.gamepad)
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
