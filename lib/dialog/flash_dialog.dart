import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';

abstract class FlashDialog {
  GtkDialog show(BuildContext context);
}
