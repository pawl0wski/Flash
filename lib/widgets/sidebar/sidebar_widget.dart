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
        children: const [AdwSidebarItem(label: "Welcome")]);
  }
}
