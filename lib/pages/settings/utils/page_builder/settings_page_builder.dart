import 'package:flash/pages/settings/bloc/settings_bloc.dart';
import 'package:flash/widgets/loading_widget/loading_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:libadwaita/libadwaita.dart';

class SettingsPageBuilder {
  const SettingsPageBuilder();

  Widget build(BuildContext context, SettingsState state) {
    if (state is SettingsStateShowSettings) {
      return AdwClamp.scrollable(
          child: Column(
        children: [],
      ));
    }
    if (state is SettingsStateLoading) {
      return const LoadingWidget();
    }
    return Container();
  }
}
