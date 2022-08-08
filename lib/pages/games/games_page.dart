import 'package:flash/pages/games/widgets/games_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/games_bloc.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GamesBloc(),
      child: BlocBuilder<GamesBloc, GamesState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment:
                _getMainAxisAlignment(isGamesEmpty: state.isGamesEmpty),
            children: [_buildTitle(context, isGamesEmpty: state.isGamesEmpty)],
          );
        },
      ),
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
