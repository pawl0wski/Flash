import 'package:flash/widgets/muted_text/muted_text_widget.dart';
import 'package:flutter/material.dart';

class SliderWithLabel extends StatelessWidget {
  final double value;
  final Function(double newValue) onChanged;
  final String label;
  final double maxValue;
  final double minValue;

  const SliderWithLabel(
      {required this.value,
      required this.onChanged,
      required this.label,
      this.maxValue = 1.0,
      this.minValue = 0.0,
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
        Slider(
          value: value,
          onChanged: onChanged,
          min: minValue,
          max: maxValue,
        )
      ],
    );
  }
}
