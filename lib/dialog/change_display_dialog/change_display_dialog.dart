import 'package:flash/dialog/change_display_dialog/bloc/change_display_bloc.dart';
import 'package:flash/dialog/flash_dialog.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/utils/repository/models/display.dart';
import 'package:flash/utils/repository/models/game.dart';
import 'package:flash/widgets/expanded_button/expanded_button.dart';
import 'package:flash/widgets/transparent_divider/transparent_divider_widget.dart';
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
            listener: (context, state) {
      if (state is ChangeDisplayStateClose) {
        Navigator.of(context).pop();
      }
    }, builder: (context, state) {
      if (state is ChangeDisplayStateShowDisplays) {
        return GtkDialog(
            title: Text(context.l10n.assignDisplay),
            width: 450,
            padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
            children: [
              _buildComboRow(context, state: state),
              const TransparentDivider(
                height: 15,
              ),
              _buildButtons(context),
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
    return AdwPreferencesGroup(
      children: [
        AdwComboRow(
          onSelected: (newIndex) => {
            context
                .read<ChangeDisplayBloc>()
                .add(ChangeDisplayEventChangeIndex(newIndex))
          },
          selectedIndex: state.currentIndex,
          choices: _changeDisplayListToStringList(state.displays),
          title: context.l10n.display,
        )
      ],
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      children: [
        ExpandedButton(
          onClick: () =>
              context.read<ChangeDisplayBloc>().add(ChangeDisplayEventSave()),
          mainButton: true,
          text: context.l10n.save,
        ),
        const SizedBox(
          width: 10,
        ),
        ExpandedButton(
          text: context.l10n.cancel,
          onClick: () =>
              context.read<ChangeDisplayBloc>().add(ChangeDisplayEventClose()),
        )
      ],
    );
  }

  List<String> _changeDisplayListToStringList(List<Display> displays) {
    return displays.map((Display display) => display.name).toList();
  }
}
