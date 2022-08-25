import 'package:flash/dialog/display_editor_dialog/display_editor_dialog.dart';
import 'package:flash/pages/displays/bloc/displays_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplaysPageListener {
  const DisplaysPageListener();

  void listen(BuildContext context, DisplaysState state) {
    if (state is DisplaysStateEditDisplay) {
      _showEditDisplayDialog(context, state);
    }
  }

  void _showEditDisplayDialog(
      BuildContext context, DisplaysStateEditDisplay state) {
    var displayEditorDialog = DisplayEditorDialog(state.displayToEdit,
        afterDisplaySave: () =>
            context.read<DisplaysBloc>().add(const DisplaysEventLoad()));
    displayEditorDialog.show(context);
  }
}
