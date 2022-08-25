import 'package:flash/dialog/change_display_dialog/bloc/change_display_bloc.dart';
import 'package:flash/dialog/flash_dialog.dart';
import 'package:flash/utils/repository/models/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libadwaita/libadwaita.dart';

class ChangeDisplayDialog extends FlashDialog {
  final Game game;

  ChangeDisplayDialog({required this.game});

  @override
  Widget show(BuildContext context) {
    return _initializeBloc(
        child: BlocConsumer<ChangeDisplayBloc, ChangeDisplayState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ChangeDisplayStateShowDisplays) {
                return const GtkDialog(children: []);
              }
              return Container();
            }));
  }

  _initializeBloc({required Widget child}) {
    return BlocProvider(
      create: (BuildContext context) => ChangeDisplayBloc(game: game),
      child: child,
    );
  }
}
