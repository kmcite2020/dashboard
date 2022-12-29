// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

import '../core.dart' as core;

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
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            Expanded(
              child: Container(
                width: size.width,
                height: size.height,
                color: core.color,
              ),
            ),
            for (final eachColor in core.colors)
              Positioned(
                left: Random().nextInt(size.width.toInt()).toDouble(),
                top: Random().nextInt(size.height.toInt()).toDouble(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: eachColor,
                    ),
                    onPressed: () {
                      core.colorUpdate = eachColor;
                    },
                    child: Text(
                      '$eachColor',
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
