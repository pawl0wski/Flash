import 'package:flutter/material.dart';

class ResizedTextField extends StatelessWidget {
  final String initialValue;
  final Function(String newValue) onChanged;

  const ResizedTextField(
      {required this.initialValue, required this.onChanged, Key? key})
      : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return SizedBox(
      height: 50,
      child: TextFormField(initialValue: initialValue, onChanged: onChanged),
    );
  }
}
