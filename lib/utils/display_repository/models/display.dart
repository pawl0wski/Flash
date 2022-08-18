import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'display.g.dart';

@HiveType(typeId: 1)
class Display extends HiveObject with EquatableMixin {
  @HiveField(0)
  double brightness;

  @HiveField(1)
  RGB rgb;

  Display({
    required this.rgb,
    this.brightness = 1.0,
  });

  @override
  List<Object?> get props => throw [];
}

class RGB {
  final int r;
  final int g;
  final int b;

  const RGB({required this.r, required this.g, required this.b});
}
