import 'package:flash/widgets/muted_text/muted_text_widget.dart';
import 'package:flutter/material.dart';

class TextFieldWithLabel extends StatelessWidget {
  final String initialValue;
  final Function(String newValue) onChanged;
  final String label;

  const TextFieldWithLabel(
      {required this.initialValue,
      required this.onChanged,
      required this.label,
      Key? key})
      : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: MutedText(label),
          ),
          TextFormField(initialValue: initialValue, onChanged: onChanged),
        ],
      ),
    );
  }
}
