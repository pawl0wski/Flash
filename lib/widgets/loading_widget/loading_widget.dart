import 'package:flash/l10n/l10n.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("${context.l10n.loading}..."),
    );
  }
}
