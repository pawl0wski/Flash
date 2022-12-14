import 'package:flash/dialog/add_game_dialog/widgets/add_game_click_on_game_widget.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libadwaita/libadwaita.dart';

import '../flash_dialog.dart';
import 'bloc/add_game_bloc.dart';

class AddGameDialog extends FlashDialog {
  AddGameDialog();

  @override
  build(BuildContext context) {
    return BlocConsumer<AddGameBloc, AddGameState>(
      bloc: AddGameBloc()..add(AddGameEventShowClickOnGame()),
      listener: (BuildContext context, AddGameState state) {
        if (state is AddGameStateClose) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return GtkDialog(
            width: 350,
            title: Text(context.l10n.addNewGame),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            children: [_buildDialogContent(context, state)]);
      },
    );
  }

  Widget _buildDialogContent(BuildContext context, AddGameState state) {
    if (state is AddGameStateClickOnGame) {
      return const AddGameClickOnGame();
    }
    return Container();
  }
}
