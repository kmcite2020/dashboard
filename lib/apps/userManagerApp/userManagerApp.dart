// ignore_for_file: prefer_const_constructors, await_only_futures, prefer_const_literals_to_create_immutables

import 'package:dashboard/apps/prayersApp/features/authentication/authentication.dart';
import 'package:dashboard/core/apps.dart';
import 'package:dashboard/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';
import 'package:uuid/uuid.dart';

class UserManagerApp extends ReactiveStatelessWidget {
  const UserManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Accounts'),
        actions: [AppSelectorToggle()],
      ),
      body: ListView(
        children: [
          AppSelector(),
          for (final eachUser in users)
            Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                children: [
                  ListTile(
                    onTap: () => RM.navigate.to(UserDetails(userModel: eachUser)),
                    leading: CircleAvatar(
                      child: Text('${eachUser.age.inDays ~/ 365}'),
                    ),
                    title: Text(
                      eachUser.email,
                      textScaleFactor: .75,
                    ),
                    subtitle: Column(
                      children: [
                        Text(
                          eachUser.password,
                          textScaleFactor: .75,
                        ),
                        Text("${eachUser.farzPrayers.inDays * 5}"),
                        Text(
                          eachUser.name.toString(),
                        ),
                        Text(DateFormat('d-M-y').format(eachUser.dateOfBirth)),
                        Text(
                          DateFormat('d-M-y').format(
                            eachUser.dateOfPuberty ?? DateTime.now(),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      floatingActionButton: ButtonBar(
        children: [
          FloatingActionButton(
            heroTag: Uuid().v1(),
            tooltip: 'DELETE ALL USERS',
            onPressed: () {
              users = <UserModel>[]; // CLEAR ALL USERS FROM REPOSITORIES
            },
            child: Icon(Icons.delete),
          ),
          FloatingActionButton(
            heroTag: Uuid().v1(),
            tooltip: 'ADD USER DATA',
            onPressed: () {
              users = [
                ...users,
                UserModel(
                  email: Uuid().v1(),
                  password: Uuid().v4(),
                  dateOfBirth: DateTime.now(),
                )
              ]; // CLEAR ALL USERS FROM REPOSITORIES
            },
            child: Icon(Icons.add),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class UserDetails extends StatelessWidget {
  const UserDetails({required this.userModel, super.key});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
