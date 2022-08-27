import 'package:flash/pages/settings/utils/page_builder/settings_page_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/settings_bloc.dart';

class SettingsPage extends StatelessWidget {
  final SettingsPageBuilder _builder;

  const SettingsPage({SettingsPageBuilder? builder, Key? key})
      : _builder = builder ?? const SettingsPageBuilder(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _initializeBloc(
        child: BlocConsumer<SettingsBloc, SettingsState>(
            builder: _builder.build,
            listener: (BuildContext context, SettingsState state) {}));
  }

  _initializeBloc({required Widget child}) {
    return BlocProvider<SettingsBloc>(
      create: (BuildContext context) =>
          SettingsBloc()..add(const SettingsEventLoadSettings()),
      child: child,
    );
  }
}
