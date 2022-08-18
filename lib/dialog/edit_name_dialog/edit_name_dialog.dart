import 'package:flash/dialog/edit_name_dialog/bloc/edit_name_bloc.dart';
import 'package:flash/dialog/edit_name_dialog/widget/edit_name_button_widget.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/utils/repository/models/game.dart';
import 'package:flash/widgets/transparent_divider/transparent_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libadwaita/libadwaita.dart';

import '../flash_dialog.dart';

class EditNameDialog extends FlashDialog {
  final Game game;

  EditNameDialog(this.game);

  @override
  Widget show(BuildContext context) {
    return _buildBloc(
      child: BlocConsumer<EditNameBloc, EditNameState>(
        listener: (context, state) {
          if (state is EditNameStateClose) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return GtkDialog(
              title: Text(context.l10n.editName),
              width: 300,
              padding: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
              children: [
                _buildTextForm(context),
                const TransparentDivider(height: 15),
                _buildButtons(context)
              ]);
        },
      ),
    );
  }

  _buildBloc({required Widget child}) {
    return BlocProvider(
      create: (BuildContext context) => EditNameBloc(game: game),
      child: child,
    );
  }

  _buildTextForm(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        initialValue: game.name,
        onChanged: (String newText) => {
          context.read<EditNameBloc>().add(EditNameEventChangeName(newText))
        },
      ),
    );
  }

  _buildButtons(BuildContext context) {
    return Row(
      children: [
        EditNameButton(
          text: context.l10n.accept,
          onClick: () => {_onAccept(context)},
          mainButton: true,
        ),
        const SizedBox(
          width: 10,
        ),
        EditNameButton(
            text: context.l10n.cancel, onClick: () => {_onCancel(context)}),
      ],
    );
  }

  _onAccept(BuildContext context) {
    context.read<EditNameBloc>().add(const EditNameEventSave());
  }

  _onCancel(BuildContext context) {
    Navigator.of(context).pop();
  }
}
