import 'package:flash/dialog/display_editor_dialog/bloc/display_editor_bloc.dart';
import 'package:flash/dialog/flash_dialog.dart';
import 'package:flash/dialog/preview_display_dialog/preview_display_dialog.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/utils/repository/models/display.dart';
import 'package:flash/widgets/expanded_button/expanded_button.dart';
import 'package:flash/widgets/slider_with_label/slider_with_label.dart';
import 'package:flash/widgets/text_field_with_label/text_field_with_label_widget.dart';
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

  _listen(BuildContext context, DisplayEditorState state) {
    if (state is DisplayEditorStateCancel) {
      Navigator.of(context).pop();
    }
    if (state is DisplayEditorStatePreviewDisplay) {
      Navigator.of(context).pop();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) =>
              PreviewDisplayDialog().show(context));
    }
  }

  Widget _build(BuildContext context, DisplayEditorState state) {
    if (state is DisplayEditorStateShowDisplay) {
      return GtkDialog(
          width: 300,
          title: Text(context.l10n.editDisplay),
          padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
          children: [
            _buildTextField(context, state),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: _buildBrightnessSlider(context, state),
            ),
            _buildGammaSlider(context, state),
            _createButtons(context,
                onPreview: () => context
                    .read<DisplayEditorBloc>()
                    .add(const DisplayEditorEventPreviewDisplay()),
                onCancel: () => context
                    .read<DisplayEditorBloc>()
                    .add(const DisplayEditorEventCancel())),
          ]);
    }
    return Container();
  }

  Widget _buildTextField(
      BuildContext context, DisplayEditorStateShowDisplay state) {
    return TextFieldWithLabel(
      label: context.l10n.name,
      initialValue: state.display.name,
      onChanged: (String newName) => context
          .read<DisplayEditorBloc>()
          .add(DisplayEditorEventChangeName(newName)),
    );
  }

  Widget _buildBrightnessSlider(
      BuildContext context, DisplayEditorStateShowDisplay state) {
    return SliderWithLabel(
        label: context.l10n.brightness,
        value: state.display.brightness,
        onChanged: (double newValue) {
          context
              .read<DisplayEditorBloc>()
              .add(DisplayEditorEventChangeBrightness(newBrightness: newValue));
        });
  }

  Widget _buildGammaSlider(
      BuildContext context, DisplayEditorStateShowDisplay state) {
    return SliderWithLabel(
        value: state.display.rgb.gamma,
        onChanged: (double newValue) => context
            .read<DisplayEditorBloc>()
            .add(DisplayEditorEventChangeGamma(newValue)),
        label: context.l10n.gamma);
  }

  Widget _createButtons(BuildContext context,
      {required void Function() onPreview, required void Function() onCancel}) {
    return Row(
      children: [
        ExpandedButton(
          mainButton: true,
          onClick: onPreview,
          text: context.l10n.previewAndSave,
        ),
        const SizedBox(
          width: 10,
        ),
        ExpandedButton(
          onClick: onCancel,
          text: context.l10n.cancel,
        )
      ],
    );
  }
}
