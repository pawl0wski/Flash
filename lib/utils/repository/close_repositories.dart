import 'package:hive_flutter/hive_flutter.dart';

closeRepositories() async {
  await Hive.close();
}
