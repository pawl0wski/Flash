import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class FlashDialog {
  Widget build(BuildContext context);

  show(BuildContext context) async {
    return showDialog(
        barrierDismissible: false,
        builder: (BuildContext context) => build(context),
        context: context);
  }
}
