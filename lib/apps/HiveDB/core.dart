import 'dart:io';

import 'package:dashboard/apps/HiveDB/databasePage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

Box get currentDB => currentDBRM.state;
bool get isWaiting => currentDBRM.isWaiting;
bool get hasError => currentDBRM.hasError;
String get error => currentDBRM.error.message;
final currentDBRM = RM.inject<Box>(
  () => throw UnimplementedError(),
);
Future<void> openBox() async {
  try {
    currentDBRM.stateAsync = Hive.openBox(currentFileRM.state);
    RM.navigate.to(DatabasePage(rxDB: currentDBRM));
  } catch (e) {
    print(e.toString());
  }
}

final currentFileRM = RM.inject<String>(() => 'DEFAULT');

List<FileSystemEntity> get files => filesRM.state;
final filesRM = RM.injectFuture(getFilesInDocumentsDirectory);
Future<List<FileSystemEntity>> getFilesInDocumentsDirectory() async {
  Directory directory = await getApplicationDocumentsDirectory();
  List<FileSystemEntity> files = directory.listSync();
  print(files);
  return files;
}
