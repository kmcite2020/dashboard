// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, annotate_overrides

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'ui/left_sidebar/left_sidebar.dart';
import 'ui/right_content_area.dart';

void main() async {
  await RM.storageInitializer(HiveStore());
  runApp(SettingsApp());
}

class SettingsApp extends ReactiveStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LeftSidebar(),
          RightContentArea(),
        ],
      ),
    );
  }
}

class HiveStore implements IPersistStore {
  late Box x;
  Future<void> init() async {
    await Hive.initFlutter();
    x = await Hive.openBox('STATES_REBUILDER');
  }

  Object? read(String k) => x.get(k);
  Future<void> write<T>(String k, T v) async => x.put(k, v);
  Future<void> delete(String k) async => x.delete(k);
  Future<void> deleteAll() async => await x.clear();
}
