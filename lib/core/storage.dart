// ignore_for_file: annotate_overrides

import 'package:hive_flutter/hive_flutter.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../apps/idealApp/controllers/core.dart';

class Storage implements IPersistStore {
  late Box x;
  Future<void> init() async {
    x = Hive.box(database);
  }

  Object? read(String k) => x.get(k);
  Future<void> write<T>(String k, T v) async => x.put(k, v);
  Future<void> delete(String k) async => x.delete(k);
  Future<void> deleteAll() async => await x.clear();
}
