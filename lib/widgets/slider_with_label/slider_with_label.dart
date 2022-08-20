import 'package:flash/widgets/muted_text/muted_text_widget.dart';
import 'package:flutter/material.dart';

class SliderWithLabel extends StatelessWidget {
  final double initialValue;
  final Function(double newValue) onChanged;
  final String label;

  const SliderWithLabel(
      {required this.initialValue,
      required this.onChanged,
      required this.label,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: MutedText(label),
        ),
        Slider(value: initialValue, onChanged: onChanged)
      ],
    );
  }
}
