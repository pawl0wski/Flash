import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/pages/settings/bloc/settings_bloc.dart';
import 'package:flash/widgets/loading_widget/loading_widget.dart';
import 'package:flash/widgets/title_widget/title_widget.dart';
import 'package:flash/widgets/transparent_divider/transparent_divider_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              description: context.l10n.settingsDescription),
          const TransparentDivider(height: 20),
          _buildMonitorSelectTile(context, state),
          _buildUseAllMonitorsTile(context, state),
          _buildCheckGameTimeout(context, state),
        ],
      ));
    }
    if (state is SettingsStateLoading) {
      return const LoadingWidget();
    }
    return Container();
  }
}

_buildMonitorSelectTile(BuildContext context, SettingsStateShowSettings state) {
  var availableMonitors = state.settingsManipulator.availableMonitors;
  var selectedMonitor = state.settingsManipulator.selectedMonitor;
  var bloc = context.read<SettingsBloc>();
  var selectedIndex = availableMonitors.indexOf(selectedMonitor);
  return AdwPreferencesGroup(
    children: [
      AdwComboRow(
          selectedIndex: selectedIndex == -1 ? 0 : selectedIndex,
          onSelected: (newIndex) => bloc.add(
              SettingsEventChangeSelectedMonitor(availableMonitors[newIndex])),
          choices: availableMonitors,
          title: context.l10n.selectMonitor),
    ],
  );
}

_buildUseAllMonitorsTile(
    BuildContext context, SettingsStateShowSettings state) {
  var useAllMonitorsEnabled = state.settingsManipulator.useAllMonitors;
  var bloc = context.read<SettingsBloc>();
  return AdwPreferencesGroup(children: [
    AdwSwitchRow(
        value: useAllMonitorsEnabled,
        onChanged: (_) => bloc.add(const SettingsEventToggleUseAllMonitors()),
        title: context.l10n.useAllMonitors)
  ]);
}

_buildCheckGameTimeout(BuildContext context, SettingsStateShowSettings state) {
  var availableCheckGameTimeout = [5, 15, 30, 45, 60, 100];
  var bloc = context.read<SettingsBloc>();
  var selectedIndex = availableCheckGameTimeout
      .indexOf(state.settingsManipulator.checkGameTimeout);
  return AdwPreferencesGroup(children: [
    AdwComboRow(
      selectedIndex: selectedIndex == -1 ? 1 : selectedIndex,
      onSelected: (newIndex) => bloc.add(SettingsEventChangeCheckGameTimeout(
          availableCheckGameTimeout[newIndex])),
      title: context.l10n.checkRunningGames,
      choices: availableCheckGameTimeout.map((int e) => "${e}s").toList(),
    )
  ]);
}
