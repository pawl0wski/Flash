import 'package:flash/dialog/display_editor_dialog/bloc/display_editor_bloc.dart';
import 'package:flash/dialog/flash_dialog.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/utils/repository/models/display.dart';
import 'package:flash/widgets/resized_text_field/resized_text_field_widget.dart';
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
      return GtkDialog(
          width: 300,
          title: Text(context.l10n.editDisplay),
          padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
          children: [_buildTextField(context, state)]);
    }
    return Container();
  }

  Widget _buildTextField(
      BuildContext context, DisplayEditorStateShowDisplay state) {
    return ResizedTextField(
      initialValue: state.display.name,
      onChanged: (String newName) => context
          .read<DisplayEditorBloc>()
          .add(DisplayEditorEventChangeName(newName: newName)),
    );
  }
}
