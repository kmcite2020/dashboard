// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'device_settings_data.dart';

class DeviceSettingsPage extends ReactiveStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        for (final eachDeviceSetting in devicesData)
          ListTile(
            title: Text(eachDeviceSetting[0]),
          ),
      ],
    );
  }
}
