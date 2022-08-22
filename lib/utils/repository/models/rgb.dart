import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'rgb.g.dart';

@HiveType(typeId: 2)
class RGB extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int r;
  @HiveField(1)
  final int g;
  @HiveField(2)
  final int b;

  RGB({required this.r, required this.g, required this.b});

  double get gamma => ((r + g + b) / 3 / 255);

  static fromGamma(double gamma) {
    var color = (gamma * 255).floor();
    return RGB(r: color, g: color, b: color);
  }

  @override
  List<Object?> get props => [r, g, b];
}
