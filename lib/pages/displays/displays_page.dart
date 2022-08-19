import 'package:flash/pages/displays/utils/page_builder/displays_page_builder.dart';
import 'package:flash/pages/displays/utils/page_listener/displays_page_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/displays_bloc.dart';

class DisplaysPage extends StatelessWidget {
  final DisplaysPageBuilder _pageBuilder;
  final DisplaysPageListener _pageListener;

  const DisplaysPage(
      {DisplaysPageBuilder? pageBuilder,
      DisplaysPageListener? pageListener,
      Key? key})
      : _pageBuilder = pageBuilder ?? const DisplaysPageBuilder(),
        _pageListener = pageListener ?? const DisplaysPageListener(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _initializeBloc(
        child: BlocConsumer<DisplaysBloc, DisplaysState>(
            builder: _pageBuilder.build, listener: _pageListener.listen));
  }

  Widget _initializeBloc({required Widget child}) {
    return BlocProvider(
      create: (BuildContext context) =>
          DisplaysBloc()..add(const DisplaysEventLoad()),
      child: child,
    );
  }
}
