import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/pages/displays/bloc/displays_bloc.dart';
import 'package:flash/widgets/title_widget/title_widget.dart';
import 'package:flutter/material.dart';

class DisplaysPageBuilder {
  const DisplaysPageBuilder();

  Widget build(BuildContext context, DisplaysState state) {
    return Column(
      children: [_buildTitle(context)],
    );
  }

  TitleWidget _buildTitle(BuildContext context) {
    return TitleWidget(
        icon: AdwaitaIcons.sun,
        title: context.l10n.displays,
        description: ""); // TODO: Add description
  }
}
