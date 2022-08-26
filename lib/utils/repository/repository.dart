import 'package:flash/utils/hive_box/hive_box.dart';
import 'package:flash/utils/repository/mixins/object_with_uuid.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import 'exceptions/repository_update_exception.dart';

abstract class Repository<T> {
  final HiveBox _hiveBox;
  final Uuid _uuid;

  Repository({required HiveBox hiveBox, Uuid? uuid})
      : _hiveBox = hiveBox,
        _uuid = uuid ?? const Uuid();

  T? get(String uuid) {
    var object = box.get(uuid);
    return object;
  }

  List<T> getAll() {
    List<T> objects = [];
    for (var uuid in box.keys) {
      var object = box.get(uuid);
      if (object != null) objects.add(object);
    }
    return objects;
  }

  void delete(String uuid) {
    box.delete(uuid);
  }

  T add(T object) {
    String uuid = generateUuid();
    object = assignUuidToObject(uuid, object as ObjectWithUuid);
    box.put(uuid, object);
    return object;
  }

  void update(T object) {
    var uuid = getUuidFromObjectOrThrowUpdateException(object as ObjectWithUuid,
        message: "The object you want to update is not added");
    box.put(uuid, object);
  }

  T addOrUpdate(T object) {
    var uuid = (object as ObjectWithUuid).uuid;
    if (uuid == "") {
      return add(object);
    } else {
      update(object);
    }
    return object;
  }

  @protected
  String generateUuid() {
    return _uuid.v4();
  }

  @protected
  String getUuidFromObjectOrThrowUpdateException(ObjectWithUuid object,
      {String? message}) {
    if (object.uuid == "") {
      throw RepositoryUpdateException(message);
    }
    return object.uuid;
  }

  @protected
  T assignUuidToObject(String uuid, ObjectWithUuid object) {
    object.uuid = uuid;
    return object as T;
  }

  @protected
  Box get box => _hiveBox.box;
}
