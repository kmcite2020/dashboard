// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:dashboard/apps/settingsApp/core/index.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../settingsApp.dart';
import 'devices/device_settings_page.dart';
import 'system/system_settings_page.dart';
import 'top_right_buttons.dart';
import 'updates/update_page.dart';

class RightContentArea extends ReactiveStatelessWidget {
  const RightContentArea({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [TopRightButtons(), listOfPages[indexRM.state]],
    );
  }
}

var listOfPages = [
  SystemSettings(),
  DeviceSettingsPage(),
  DeviceSettingsPage(),
  DeviceSettingsPage(),
  DeviceSettingsPage(),
  DeviceSettingsPage(),
  DeviceSettingsPage(),
  DeviceSettingsPage(),
  DeviceSettingsPage(),
  DeviceSettingsPage(),
  UpdatePage()
];
