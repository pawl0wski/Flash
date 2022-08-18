import 'package:flash/utils/repository/hive_box/hive_box.dart';
import 'package:flash/utils/repository/models/display.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DisplayHiveBox extends HiveBox {
  static Box<Display>? _displayBox;
  final HiveInterface _hive;

  DisplayHiveBox({HiveInterface? hive}) : _hive = hive ?? Hive;

  @override
  void resetBox() {
    _displayBox = null;
  }

  @override
  Box<Display> get box {
    DisplayHiveBox._displayBox ??= _hive.box("displays");
    return DisplayHiveBox._displayBox!;
  }
}
