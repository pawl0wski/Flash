import 'package:flash/utils/repository/hive_box/display_hive_box.dart';
import 'package:flash/utils/repository/models/display.dart';

import 'repository.dart';

class DisplayRepository extends Repository<Display> {
  DisplayRepository({DisplayHiveBox? hiveBox})
      : super(hiveBox: hiveBox ?? DisplayHiveBox());
}
