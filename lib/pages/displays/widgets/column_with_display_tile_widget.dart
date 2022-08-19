import 'package:flash/utils/repository/models/display.dart';
import 'package:flutter/material.dart';

import 'display_tile_widget.dart';

class ColumnWithDisplayTile extends StatelessWidget {
  final List<Display> _displays;

  const ColumnWithDisplayTile({required List<Display> displays, Key? key})
      : _displays = displays,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildDisplayTiles(context),
    );
  }

  List<DisplayTile> _buildDisplayTiles(BuildContext context) {
    List<DisplayTile> displayTiles = [];
    for (var display in _displays) {
      displayTiles.add(DisplayTile(display: display));
    }
    return displayTiles;
  }
}
