import 'package:flash/dialog/display_editor_dialog/display_editor_dialog.dart';
import 'package:flash/dialog/preview_display_dialog/bloc/preview_display_bloc.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/utils/repository/models/display.dart';
import 'package:flash/widgets/expanded_button/expanded_button.dart';
import 'package:flash/widgets/transparent_divider/transparent_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libadwaita/libadwaita.dart';

import '../flash_dialog.dart';

class PreviewDisplayDialog extends FlashDialog {
  final Display display;
  final void Function() afterDisplaySave;

  PreviewDisplayDialog(this.display, {required this.afterDisplaySave});

  @override
  Widget show(BuildContext context) {
    return _initializeBloc(
        child: BlocConsumer<PreviewDisplayBloc, PreviewDisplayState>(
            listener: (BuildContext context, PreviewDisplayState state) {
      if (state is PreviewDisplayStateClose) {
        afterDisplaySave();
        Navigator.of(context).pop();
      }
      if (state is PreviewDisplayStateBackToEdit) {
        Navigator.of(context).pop();
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) =>
                DisplayEditorDialog(display, afterDisplaySave: afterDisplaySave)
                    .show(context));
      }
    }, builder: (BuildContext context, PreviewDisplayState state) {
      if (state is PreviewDisplayStateSetSecond) {
        return GtkDialog(
            title: Text(context.l10n.preview),
            width: 300,
            padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
            children: [
              _buildTimerText(context, state),
              const TransparentDivider(height: 10),
              _buildInfoText(context),
              const TransparentDivider(height: 10),
              _buildButtons(context)
            ]);
      }
      return Container();
    }));
  }

  _initializeBloc({required Widget child}) {
    return BlocProvider<PreviewDisplayBloc>(
        child: child,
        create: (BuildContext context) => PreviewDisplayBloc(display)
          ..add(const PreviewDisplayEventStartTimer()));
  }

  _buildTimerText(BuildContext context, PreviewDisplayStateSetSecond state) {
    var theme = Theme.of(context);
    return Text(
      "${state.second}s",
      style: theme.textTheme.headline1,
      textAlign: TextAlign.center,
    );
  }

  _buildInfoText(BuildContext context) {
    return Text(
      context.l10n.acceptDisplay,
      textAlign: TextAlign.center,
    );
  }

  _buildButtons(BuildContext context) {
    return Row(
      children: [
        ExpandedButton(
          text: context.l10n.accept,
          mainButton: true,
          onClick: () => context
              .read<PreviewDisplayBloc>()
              .add(const PreviewDisplayEventAccept()),
        ),
        const SizedBox(
          width: 10,
        ),
        ExpandedButton(
            text: context.l10n.cancel,
            onClick: () => context
                .read<PreviewDisplayBloc>()
                .add(const PreviewDisplayEventClose()))
      ],
    );
  }
}
