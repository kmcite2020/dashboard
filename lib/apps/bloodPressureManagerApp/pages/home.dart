// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:dashboard/apps/bloodPressureManagerApp/pages/addBPEntry.dart';
import 'package:dashboard/core/apps.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../../core/themes.dart';

class MyHomepage extends StatelessWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // RM.navigate.to(SettingsPage());
            },
            icon: Icon(
              Icons.settings,
            ),
          ),
          AppSelectorToggle()
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              color: color,
            ),
            AppSelector(),

            // for (final eachColor in colors)
            //   Positioned(
            //     left: Random().nextInt(size.width.toInt()).toDouble(),
            //     top: Random().nextInt(size.height.toInt()).toDouble(),
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: eachColor,
            //         ),
            //         onPressed: () {
            //           color = eachColor;
            //         },
            //         child: Text(
            //           '$eachColor',
            //         ),
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RM.navigate.to(AddBPEntry());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
