import 'package:flash/pages/games/bloc/games_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GamesEventsAdder {
  final BuildContext _context;

  GamesEventsAdder(BuildContext context) : _context = context;

  GamesBloc get _bloc => _context.read<GamesBloc>();

  loadGames() {
    _bloc.add(GamesEventLoadGames());
  }

  showAddGameDialog() {
    _bloc.add(GamesEventShowAddGameDialog());
  }
}
