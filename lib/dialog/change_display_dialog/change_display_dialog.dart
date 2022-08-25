import 'package:flash/dialog/change_display_dialog/bloc/change_display_bloc.dart';
import 'package:flash/dialog/flash_dialog.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/utils/repository/models/display.dart';
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
                return GtkDialog(
                    width: 300,
                    padding:
                        const EdgeInsets.only(bottom: 20, left: 15, right: 15),
                    children: [
                      _buildComboRow(context, state: state),
                    ]);
              }
              return Container();
            }));
  }

  _initializeBloc({required Widget child}) {
    return BlocProvider(
      create: (BuildContext context) =>
          ChangeDisplayBloc(game: game)..add(ChangeDisplayEventLoadDisplays()),
      child: child,
    );
  }

  Widget _buildComboRow(BuildContext context,
      {required ChangeDisplayStateShowDisplays state}) {
    return AdwComboRow(
      onSelected: (newIndex) => {
        context
            .read<ChangeDisplayBloc>()
            .add(ChangeDisplayEventChangeIndex(newIndex))
      },
      selectedIndex: state.currentIndex,
      choices: _changeDisplayListToStringList(state.displays),
      title: context.l10n.assignDisplay,
    );
  }

  List<String> _changeDisplayListToStringList(List<Display> displays) {
    return displays.map((Display display) => display.name).toList();
  }
}
