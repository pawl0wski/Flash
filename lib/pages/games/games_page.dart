import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/games_bloc.dart';
import 'utils/page_builder/games_page_builder.dart';
import 'utils/page_listener/games_page_listener.dart';

class GamesPage extends StatelessWidget {
  final GamesPageBuilder _builder;
  final GamesPageListener _listener;

  const GamesPage(
      {GamesPageBuilder? builder, GamesPageListener? listener, Key? key})
      : _listener = listener ?? const GamesPageListener(),
        _builder = builder ?? const GamesPageBuilder(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _initializeBloc(
      child: BlocConsumer<GamesBloc, GamesState>(
        buildWhen: (prev, current) => _stateShouldRebuild(current),
        listenWhen: (prev, current) => !_stateShouldRebuild(current),
        listener: _listener.listen,
        builder: _builder.build,
      ),
    );
  }

  _initializeBloc({required Widget child}) {
    return BlocProvider(
        create: (context) => GamesBloc()..add(GamesEventLoadGames()),
        child: child);
  }

  _stateShouldRebuild(GamesState state) {
    return state is! GamesStateShowAddGameDialog &&
        state is! GamesStateShowEditNameDialog;
  }
}
