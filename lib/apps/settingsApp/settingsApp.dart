// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, annotate_overrides

import 'package:dashboard/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'core/index.dart';
import 'ui/left_sidebar/left_sidebar.dart';
import 'ui/left_sidebar/settings_labels_and_icons.dart';
import 'ui/right_content_area.dart';

class SettingsApp extends ReactiveStatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          ...themingWidgets(size),
          ListTile(
            leading: CircleAvatar(backgroundColor: color, child: FlutterLogo()),
            title: Text('Adnan Farooq'),
            subtitle: Text(
              'college.learning.458@outlook.com',
            ),
          ),
          for (final eachSetting in settingsList)
            ListTile(
              leading: eachSetting[1],
              selected: indexRM.state == settingsList.indexOf(eachSetting),
              onTap: () => indexRM.state = settingsList.indexOf(eachSetting),
              title: Text(eachSetting[0]),
            ),
          RightContentArea(),
        ],
      ),
    );
  }
}
