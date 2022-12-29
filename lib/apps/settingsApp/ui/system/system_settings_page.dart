// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'system_settings_labels_data.dart';

class SystemSettings extends ReactiveStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        for (final List eachSystemSettings in systemSettingsData)
          ListTile(
            title: Text(eachSystemSettings[0]),
            leading: eachSystemSettings[1],
          ),
      ],
    );
  }
}
