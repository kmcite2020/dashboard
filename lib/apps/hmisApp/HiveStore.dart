// ignore_for_file: file_names

import 'package:hive_flutter/hive_flutter.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class HiveStore implements IPersistStore {
  late Box x;
  @override
  Future<void> init() async {
    await Hive.initFlutter();
    x = await Hive.openBox('STATES_REBUILDER');
  }

  @override
  Object? read(String k) => x.get(k);
  @override
  Future<void> write<T>(String k, T v) async => x.put(k, v);
  @override
  Future<void> delete(String k) async => x.delete(k);
  @override
  Future<void> deleteAll() async => await x.clear();
}
