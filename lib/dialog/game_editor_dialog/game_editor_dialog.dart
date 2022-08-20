import 'package:flash/dialog/game_editor_dialog/bloc/game_editor_bloc.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/utils/repository/models/game.dart';
import 'package:flash/widgets/resized_text_field/resized_text_field_widget.dart';
import 'package:flash/widgets/transparent_divider/transparent_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libadwaita/libadwaita.dart';

import '../flash_dialog.dart';
import 'widget/game_editor_button_widget.dart';

class GameEditorDialog extends FlashDialog {
  final Game game;

  GameEditorDialog(this.game);

  @override
  Widget show(BuildContext context) {
    return _buildBloc(
      child: BlocConsumer<GameEditorBloc, GameEditorState>(
        listener: (context, state) {
          if (state is GameEditorStateClose) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return GtkDialog(
              title: Text(context.l10n.editName),
              width: 300,
              padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
              children: [
                _buildTextField(context),
                const TransparentDivider(height: 15),
                _buildButtons(context)
              ]);
        },
      ),
    );
  }

  _buildBloc({required Widget child}) {
    return BlocProvider(
      create: (BuildContext context) => GameEditorBloc(game: game),
      child: child,
    );
  }

  _buildTextField(BuildContext context) {
    return ResizedTextField(
        initialValue: game.name,
        onChanged: (String newText) => context
            .read<GameEditorBloc>()
            .add(GameEditorEventChangeName(newText)));
  }

  _buildButtons(BuildContext context) {
    return Row(
      children: [
        GameEditorButton(
          text: context.l10n.accept,
          onClick: () => {_onAccept(context)},
          mainButton: true,
        ),
        const SizedBox(
          width: 10,
        ),
        GameEditorButton(
            text: context.l10n.cancel, onClick: () => {_onCancel(context)}),
      ],
    );
  }

  _onAccept(BuildContext context) {
    context.read<GameEditorBloc>().add(const GameEditorEventSave());
  }

  _onCancel(BuildContext context) {
    Navigator.of(context).pop();
  }
}
