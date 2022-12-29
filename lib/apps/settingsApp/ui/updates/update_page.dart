// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class UpdatePage extends ReactiveStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: Text('Check for Updates'),
          subtitle: Text('Last checked: Yesterday'),
          trailing: ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.update),
          ),
        ),
        for (final eachUpdateSetting in data)
          ListTile(
            title: Text(eachUpdateSetting[0]),
          ),
      ],
    );
  }
}

List data = [
  [
    'Pause Updates',
    ElevatedButton(
      onPressed: () {},
      child: Text(
        'Lovely',
      ),
    ),
  ],
  ['Update History'],
  ['Advanced Options'],
  ['Windows Insider Program'],
];
