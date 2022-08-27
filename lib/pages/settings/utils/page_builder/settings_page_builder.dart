import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/pages/settings/bloc/settings_bloc.dart';
import 'package:flash/widgets/loading_widget/loading_widget.dart';
import 'package:flash/widgets/title_widget/title_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:libadwaita/libadwaita.dart';

class SettingsPageBuilder {
  const SettingsPageBuilder();

  Widget build(BuildContext context, SettingsState state) {
    if (state is SettingsStateShowSettings) {
      return AdwClamp.scrollable(
          child: Column(
        children: [
          TitleWidget(
              showBigAdwaitaIcon: false,
              icon: AdwaitaIcons.settings,
              title: context.l10n.settings,
              description: context.l10n.settingsDescription)
        ],
      ));
    }
    if (state is SettingsStateLoading) {
      return const LoadingWidget();
    }
    return Container();
  }
}
