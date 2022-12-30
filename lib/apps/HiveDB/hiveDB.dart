// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_returning_null_for_void, file_names

import 'dart:io';

import 'package:dashboard/apps/HiveDB/databasePage.dart';
import 'package:dashboard/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../core/apps.dart';
import '../../core/utils.dart';
import 'core.dart';
import 'databaseDetails.dart';

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
      body: ListView(
        children: [
          AppSelector(),
          Padding(
            padding: EdgeInsets.all(padding),
            child: Text('Please look for file ending with .hive and select it.', textScaleFactor: 1.5),
          ),
          if (filesRM.isWaiting)
            Center(child: CircularProgressIndicator())
          else
            for (final file in files)
              ListTile(
                selected: currentFileRM.state == file.uri.pathSegments.last.split('.hive').first,
                onTap: () {
                  currentFileRM.state = file.uri.pathSegments.last.split('.hive').first;
                },
                title: Column(
                  children: [
                    Text(
                      file.uri.pathSegments.last.split('.hive').first,
                    ),
                  ],
                ),
                subtitle: Text(
                  file.path,
                ),
              ),
          Text(
            'Error',
          )
        ],
      ),
      floatingActionButton: ButtonBar(
        children: [
          FloatingActionButton(
            heroTag: randomID,
            onPressed: () {
              openBox();
            },
            tooltip: 'Load a DB',
            child: Icon(
              Icons.leaderboard_outlined,
            ),
          ),
          FloatingActionButton(
            heroTag: randomID,
            onPressed: () async {
              // databaseModel.currentDBRM.state = await databaseModel.openBox();
              RM.navigate.to(
                DatabasePage(
                  rxDB: currentDBRM,
                ),
              );
            },
            tooltip: 'Open Database Page',
            child: Icon(
              Icons.leaderboard_outlined,
            ),
          ),
        ],
      ),
    );
  }
}





/// clear - delete all entries
/// close -
/// compact - optimize
/// check if specific key is present | return the value /true at the key
/// create a map from box
/// add k-v pair
/// add map k-v pairs
/// add at specific key loacation
/// return a key at specific index
/// edit an existing key's value
/// delete a value

