import 'package:flash/dialog/preview_display_dialog/bloc/preview_display_bloc.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libadwaita/libadwaita.dart';

import '../flash_dialog.dart';

class PreviewDisplayDialog extends FlashDialog {
  @override
  Widget show(BuildContext context) {
    return _initializeBloc(
        child: BlocConsumer<PreviewDisplayBloc, PreviewDisplayState>(
            listener: (BuildContext context, PreviewDisplayState state) => {},
            builder: (BuildContext context, PreviewDisplayState state) {
              return GtkDialog(children: [_buildInfoText(context)]);
            }));
  }

  _initializeBloc({required Widget child}) {
    return BlocProvider<PreviewDisplayBloc>(
        child: child, create: (BuildContext context) => PreviewDisplayBloc());
  }

  _buildInfoText(BuildContext context) {
    return Text(context.l10n.acceptDisplay);
  }
}
