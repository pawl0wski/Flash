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
    var displaysPageContext = context;
    showDialog(
        context: context,
        builder: (BuildContext context) => DisplayEditorDialog(
            state.displayToEdit,
            afterDisplaySave: () => displaysPageContext
                .read<DisplaysBloc>()
                .add(const DisplaysEventLoad())).show(context));
  }
}
