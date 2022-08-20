import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/widgets/loading_widget/loading_widget.dart';
import 'package:flash/widgets/title_widget/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/displays_bloc.dart';
import '../../widgets/column_with_display_tile_widget.dart';

class DisplaysPageBuilder {
  const DisplaysPageBuilder();

  Widget build(BuildContext context, DisplaysState state) {
    if (state is DisplaysStateLoaded) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTitle(context, isDisplaysEmpty: state.displays.isEmpty),
          ColumnWithDisplayTile(displays: state.displays)
        ],
      );
    }
    return const LoadingWidget();
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
