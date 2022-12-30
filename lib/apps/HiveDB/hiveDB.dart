// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_returning_null_for_void, file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../core/apps.dart';
import '../../core/utils.dart';

class HiveDB extends ReactiveStatelessWidget {
  const HiveDB({super.key});
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

@immutable
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentDB = databaseModel.currentDB;
    return Scaffold(
      appBar: AppBar(
        actions: [AppSelectorToggle()],
        elevation: 0,
        toolbarHeight: 80,
        title: Text(
          'HiveDB Explorer',
          textScaleFactor: 1.2,
        ),
      ),
      body: databaseModel.currentDB == null
          ? ListView(
              children: [
                AppSelector(),
                OnFormFieldBuilder(
                  listenTo: databaseModel.currentFileRM,
                  builder: (_, __) => DropdownButton<String>(
                    value: _,
                    items: databaseModel.files.map(
                      (e) {
                        return DropdownMenuItem(
                          value: e.uri.pathSegments.last,
                          child: Text(e.uri.pathSegments.last),
                        );
                      },
                    ).toList()
                      ..add(DropdownMenuItem(value: null.toString(), child: Text('LOVE'))),
                    onChanged: __,
                  ),
                ),
                for (final file in databaseModel.files)
                  ListTile(
                    title: Column(
                      children: [
                        Text(
                          file.uri.pathSegments.last,
                        ),
                      ],
                    ),
                    subtitle: Text(
                      file.path,
                    ),
                  ),
              ],
            )
          : databaseModel.isWaiting
              ? Center(child: CircularProgressIndicator())
              : databaseModel.hasError
                  ? Text(
                      'Error',
                    )
                  : ListView(
                      children: <Widget>[
                        Text(currentDB!.path!),
                        Text(currentDB.name),
                        Text(currentDB.hashCode.toString()),
                        Text("isOpen ${currentDB.isOpen}"),
                        Text("Lazy ${currentDB.lazy}"),
                        Text("isEmpty ${currentDB.isEmpty}"),
                        Text("isNotEmpty ${currentDB.isNotEmpty}"),
                        Text(currentDB.length.toString()),
                        // Text(currentDB),
                        Text(currentDB.hashCode.toString()),
                        Text(currentDB.hashCode.toString()),
                        Text(Directory.current.path),

                        Column(
                          children: [
                            for (final k in currentDB.keys) Text(k),
                            for (final k in currentDB.values) Text(k),
                          ],
                        ),
                      ],
                    ),
      floatingActionButton: FloatingActionButton(
        heroTag: randomID,
        onPressed: () async {
          showDialog<Box?>(
            context: context,
            builder: (context) => SimpleDialog(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: databaseModel.boxName.controller,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      databaseModel.currentDBRM.stateAsync = Hive.openBox(
                        databaseModel.boxName.value,
                      );
                      RM.navigate.back();
                    },
                    child: Text(
                      'Open DB',
                    ),
                  ),
                )
              ],
            ),
          );
        },
        tooltip: 'Load a DB',
        child: Icon(
          Icons.leaderboard_outlined,
        ),
      ),
    );
  }
}

final DatabaseModel databaseModel = DatabaseModel();

@immutable
class DatabaseModel {
  Box? get currentDB => currentDBRM.state;
  bool get isWaiting => currentDBRM.isWaiting;
  bool get hasError => currentDBRM.hasError;
  String get error => currentDBRM.error.message;
  final currentDBRM = RM.inject<Box?>(
    () => null,
    debugPrintWhenNotifiedPreMessage: 'DB',
    toDebugString: (p0) => p0.toString(),
  );
  final boxName = RM.injectTextEditing();
  openBox() async {
    try {
      return Hive.openBox(currentFileRM.state!);
    } catch (e) {
      print(e.toString());
    }
  }

  final currentFileRM = RM.inject<String?>(() => '');

  List<FileSystemEntity> get files => filesRM.state;
  final filesRM = RM.injectFuture(getFilesInDocumentsDirectory);
  static Future<List<FileSystemEntity>> getFilesInDocumentsDirectory() async {
    Directory directory = await getApplicationDocumentsDirectory();
    List<FileSystemEntity> files = directory.listSync();
    print(files);
    return files;
  }



///clear - delete all entries
///close -
///compact - optimize
/// check if specific key is present | return the value /true at the key
/// create a map from box
/// add k-v pair
/// add map k-v pairs
/// add at specific key loacation
/// return a key at specific index
/// edit an existing key's value
/// delete a value
