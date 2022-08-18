import 'package:hive_flutter/hive_flutter.dart';

mixin ObjectWithUuid {
  @HiveField(0, defaultValue: "")
  String uuid = "";
}
