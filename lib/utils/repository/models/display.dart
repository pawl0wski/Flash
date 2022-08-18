import 'package:equatable/equatable.dart';
import 'package:flash/utils/repository/mixins/object_with_uuid.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'display.g.dart';

@HiveType(typeId: 1)
class Display extends HiveObject with EquatableMixin, ObjectWithUuid {
  @HiveField(1)
  double brightness;

  @HiveField(2)
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
