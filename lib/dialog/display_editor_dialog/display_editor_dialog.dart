import 'package:flash/dialog/display_editor_dialog/bloc/display_editor_bloc.dart';
import 'package:flash/dialog/flash_dialog.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/utils/repository/models/display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libadwaita/libadwaita.dart';

class DisplayEditorDialog extends FlashDialog {
  final Display _display;

  DisplayEditorDialog({required Display display}) : _display = display;

  @override
  Widget show(BuildContext context) {
    return _initializeBloc(
        child: BlocConsumer<DisplayEditorBloc, DisplayEditorState>(
            listener: _listen, builder: _build));
  }

  _initializeBloc({required Widget child}) {
    return BlocProvider(
      create: (BuildContext context) => DisplayEditorBloc(display: _display),
      child: child,
    );
  }

  _listen(BuildContext context, DisplayEditorState state) {}

  Widget _build(BuildContext context, DisplayEditorState state) {
    if (state is DisplayEditorStateShowDisplay) {
      return GtkDialog(title: Text(context.l10n.editDisplay), children: []);
    }
    return Container();
  }
}
