import 'package:flash/pages/games/bloc/games_bloc.dart';
import 'package:flutter/material.dart';

import '../../widgets/games_list_with_title_widget.dart';
import '../../widgets/games_loading_widget.dart';
import '../games_event_adder/games_event_adder.dart';

class GamesPageBuilder {
  const GamesPageBuilder();

  Widget build(BuildContext context, GamesState state) {
    if (state is GamesStateLoaded) {
      return GamesListWithTitle(
          state: state,
          showAddGameDialog: _createEventsAdder(context).showAddGameDialog);
    } else {
      return const GamesLoading();
    }
  }

  GamesEventsAdder _createEventsAdder(BuildContext context) {
    return GamesEventsAdder(context);
  }
}
