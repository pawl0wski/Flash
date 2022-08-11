import 'package:flash/l10n/l10n.dart';
import 'package:flash/pages/games/widgets/games_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/games_bloc.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _initializeBloc(
      child: BlocBuilder<GamesBloc, GamesState>(
        builder: (context, state) {
          if (state is GamesStateLoading) {
            return _returnPageIfStateIsLoading(context, state);
          } else {
            return _returnPageIfStateIsLoaded(
                context, state as GamesStateLoaded);
          }
        },
      ),
    );
  }

  _initializeBloc({required Widget child}) {
    return BlocProvider(
        create: (context) => GamesBloc()..add(GamesEventLoadGames()),
        child: child);
  }

  Widget _returnPageIfStateIsLoading(
      BuildContext context, GamesStateLoading state) {
    return Center(
      child: Text("${context.l10n.loading}..."),
    );
  }

  Widget _returnPageIfStateIsLoaded(
      BuildContext context, GamesStateLoaded state) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment:
          _getMainAxisAlignment(isGamesEmpty: state.isGamesEmpty),
      children: [_buildTitle(context, isGamesEmpty: state.isGamesEmpty)],
    );
  }

  MainAxisAlignment _getMainAxisAlignment({required bool isGamesEmpty}) {
    if (isGamesEmpty) {
      return MainAxisAlignment.center;
    }
    return MainAxisAlignment.start;
  }

  Widget _buildTitle(BuildContext context, {required bool isGamesEmpty}) {
    return GamesTitle(
      isGamesEmpty: isGamesEmpty,
    );
  }
}
