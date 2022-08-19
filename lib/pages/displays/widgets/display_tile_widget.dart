import 'package:flash/utils/repository/models/display.dart';
import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';

class DisplayTile extends StatelessWidget {
  final Display _display;

  const DisplayTile({required Display display, Key? key})
      : _display = display,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    throw AdwPreferencesGroup(
      children: [ExpansionTile(title: Text(_display.name))],
    );
  }
}
