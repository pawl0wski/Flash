import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/pages/displays/widgets/display_tile_widget.dart';
import 'package:flash/utils/repository/models/display.dart';
import 'package:flash/widgets/loading_widget/loading_widget.dart';
import 'package:flash/widgets/title_widget/title_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libadwaita/libadwaita.dart';

import '../../bloc/displays_bloc.dart';

class DisplaysPageBuilder {
  const DisplaysPageBuilder();

  Widget build(BuildContext context, DisplaysState state) {
    if (state is DisplaysStateLoaded) {
      return _buildColumnIfDisplaysIsNotEmpty(
        context,
        child: _buildTitle(context, isDisplaysEmpty: state.displays.isEmpty),
        displays: state.displays,
      );
    }
    return const LoadingWidget();
  }

  Widget _buildColumnIfDisplaysIsNotEmpty(BuildContext context,
      {required List<Display> displays, required Widget child}) {
    if (displays.isNotEmpty) {
      return AdwClamp.scrollable(
          child: Column(children: [
        child,
        ..._buildDisplayTiles(context, displays: displays)
      ]));
    }
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [child]);
  }

  List<DisplayTile> _buildDisplayTiles(BuildContext context,
      {required List<Display> displays}) {
    List<DisplayTile> displayTiles = [];
    for (var display in displays) {
      displayTiles.add(DisplayTile(display: display));
    }
    return displayTiles;
  }

  TitleWidget _buildTitle(BuildContext context,
      {required bool isDisplaysEmpty}) {
    return TitleWidget(
        showBigAdwaitaIcon: isDisplaysEmpty,
        icon: AdwaitaIcons.sun,
        title: context.l10n.displays,
        description: context.l10n.displaysDescription,
        buttonText: context.l10n.addNewDisplay,
        onTap: () => context
            .read<DisplaysBloc>()
            .add(const DisplaysEventCreateNewDisplay()));
  }
}
