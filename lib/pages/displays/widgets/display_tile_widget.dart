import 'package:adwaita_icons/adwaita_icons.dart';
import 'package:flash/l10n/l10n.dart';
import 'package:flash/pages/displays/bloc/displays_bloc.dart';
import 'package:flash/utils/repository/models/display.dart';
import 'package:flash/widgets/expansion_title_without_color_change/expansion_tile_without_color_change_widget.dart';
import 'package:flash/widgets/secondary_tile/secondary_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libadwaita/libadwaita.dart';

class DisplayTile extends StatelessWidget {
  final Display _display;

  const DisplayTile({required Display display, Key? key})
      : _display = display,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdwPreferencesGroup(
      children: [
        ExpansionTileWithoutColorChange(
          title: Text(_display.name),
          children: [
            _buildBrightnessTile(context),
            _buildGammaTile(context),
            ...(_display.readOnly
                ? []
                : [
                    _buildEditTile(context, display: _display),
                    _buildDeleteTile(context, display: _display)
                  ])
          ],
        )
      ],
    );
  }

  SecondaryTile _buildBrightnessTile(BuildContext context) {
    String brightness = _display.brightness.toStringAsPrecision(2);
    return SecondaryTile(
        leading: const AdwaitaIcon(AdwaitaIcons.display_brightness),
        title: Text("${context.l10n.brightness} - $brightness"));
  }

  SecondaryTile _buildGammaTile(BuildContext context) {
    String gamma = _display.rgb.gamma.toStringAsPrecision(2);
    return SecondaryTile(
        leading: const AdwaitaIcon(AdwaitaIcons.camera_flash),
        title: Text("${context.l10n.gamma} - $gamma"));
  }

  SecondaryTile _buildEditTile(BuildContext context,
      {required Display display}) {
    return SecondaryTile(
      leading: const AdwaitaIcon(AdwaitaIcons.edit),
      title: Text(context.l10n.editDisplay),
      onTap: () =>
          context.read<DisplaysBloc>().add(DisplaysEventEditDisplay(display)),
    );
  }

  SecondaryTile _buildDeleteTile(BuildContext context,
      {required Display display}) {
    return SecondaryTile(
      leading: const AdwaitaIcon(AdwaitaIcons.edit_delete),
      title: Text(context.l10n.deleteDisplay),
      onTap: () =>
          context.read<DisplaysBloc>().add(DisplaysEventDeleteDisplay(display)),
    );
  }
}
