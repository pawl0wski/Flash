import 'package:equatable/equatable.dart';
import 'package:flash/utils/repository/mixins/object_with_uuid.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'display.g.dart';

@HiveType(typeId: 1)
class Display extends HiveObject with EquatableMixin, ObjectWithUuid {
  @HiveField(1, defaultValue: "")
  String name;

  @HiveField(2)
  double brightness;

  @HiveField(3)
  RGB rgb;

  Display({
    required this.rgb,
    required this.name,
    this.brightness = 1.0,
  });

  static Display createBlank() {
    return Display(
        rgb: const RGB(r: 255, g: 255, b: 255),
        brightness: 1,
        name: 'Blank Display');
  }

  @override
  List<Object?> get props => throw [];
}

class RGB {
  final int r;
  final int g;
  final int b;

  const RGB({required this.r, required this.g, required this.b});
}
