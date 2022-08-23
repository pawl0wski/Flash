import 'package:equatable/equatable.dart';
import 'package:flash/utils/repository/mixins/object_with_uuid.dart';
import 'package:flash/utils/repository/models/rgb.dart';
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
        rgb: RGB(r: 1, g: 1, b: 1), brightness: 1, name: 'Blank Display');
  }

  String get gamma => "${rgb.r}:${rgb.g}:${rgb.b}";

  @override
  List<Object> get props => [uuid, name, brightness, rgb];
}
