import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveBox {
  final HiveInterface hive;

  HiveBox({HiveInterface? hive}) : hive = hive ?? Hive;

  Box get box;

  void resetBox();
}
