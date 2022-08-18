import 'package:flash/utils/display_repository/models/display.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DisplayHiveBox {
  static Box<Display>? _displayBox;
  final HiveInterface _hive;

  DisplayHiveBox({HiveInterface? hive}) : _hive = hive ?? Hive;

  static resetBox() {
    _displayBox = null;
  }

  Box<Display> get box {
    DisplayHiveBox._displayBox ??= _hive.box("displays");
    return DisplayHiveBox._displayBox!;
  }
}
