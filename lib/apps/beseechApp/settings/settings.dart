// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_import,, prefer_const_literals_to_create_immutables, unused_element, prefer_typing_uninitialized_variables, must_be_immutable, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, unused_local_variable

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../beseechApp.dart';
import '../settings/user_experience.dart';
import '../core.dart';
import 'about.dart';
import 'delete_all.dart';
import 'feedback.dart';
import 'help.dart';
import 'user_information.dart';

class Settings extends ReactiveStatelessWidget {
  static open(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Settings(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SETTINGS'),
            IconButton(
              tooltip: 'homepage',
              onPressed: () {
                Navigator.pop(context);
                // Initialize.open(context);
              },
              icon: Icon(Icons.close),
            ),
          ],
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: 3),
          UserInformation(),
          UserExperience(),
          FeedbackTile(),
          Help(),
          About(),
          DeleteAll(),
        ],
      ),
    );
  }
}
