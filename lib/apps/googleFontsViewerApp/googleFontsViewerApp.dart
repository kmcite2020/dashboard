// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_returning_null_for_void

import 'package:dashboard/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'Homepage.dart';

void main() async {
  GoogleFonts.config.allowRuntimeFetching = false;
  await RM.storageInitializer(HiveStore());
  runApp(GoogleFontsViewerApp());
}

class GoogleFontsViewerApp extends ReactiveStatelessWidget {
  const GoogleFontsViewerApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: RM.navigate.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: MyHomePage(),
    );
  }
}

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
