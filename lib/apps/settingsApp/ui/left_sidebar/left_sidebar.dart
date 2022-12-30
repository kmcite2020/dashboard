// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:dashboard/apps/settingsApp/core/index.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../../core/themes.dart';
import 'settings_labels_and_icons.dart';

class LeftSidebar extends ReactiveStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Column(
            children: [
              ListView(
                shrinkWrap: true,
                children: [],
              ),
              Spacer(),
              ListTile(
                title: Text('Select App Color'),
                subtitle: Slider(
                  min: 0,
                  max: colors.length.toDouble() - 1,
                  divisions: colors.length,
                  value: colors.indexOf(color).toDouble(),
                  onChanged: (value) {
                    colorRM.state = colors[value.toInt()];
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
