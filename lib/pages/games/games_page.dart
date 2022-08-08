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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: _getMainAxisAlignment(),
        children: [_buildTitle(context)],
      ),
    );
  }

  MainAxisAlignment _getMainAxisAlignment() {
    if (true) {
      return MainAxisAlignment.center;
    }
    return MainAxisAlignment.start;
  }

  Widget _buildTitle(BuildContext context) {
    return const GamesTitle(
      gamesEmpty: true,
    );
  }
}
