import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'rgb.g.dart';

@HiveType(typeId: 2)
class RGB extends HiveObject with EquatableMixin {
  @HiveField(0)
  final double r;
  @HiveField(1)
  final double g;
  @HiveField(2)
  final double b;

  RGB({required this.r, required this.g, required this.b});

  double get gamma => ((r + g + b) / 3);

  static fromGamma(double gamma) {
    return RGB(r: gamma, g: gamma, b: gamma);
  }

  @override
  List<Object?> get props => [r, g, b];
}
