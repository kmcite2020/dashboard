// ignore_for_file: unused_import, prefer_const_constructors, use_key_in_widget_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:uuid/uuid.dart';

import '../../core/themes.dart';
import 'HiveStore.dart';
import 'features/testing/ui.dart';

class HMIS extends TopStatelessWidget {
  @override
  ensureInitialization() => [
        Future.delayed(
          Duration(
            seconds: 3,
          ),
        ),
        RM.storageInitializer(
          HiveStore(),
        )
      ];
  @override
  Widget? splashScreen() => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Icon(
              Icons.local_hospital,
              size: 170,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => OnReactive(
        () => MaterialApp(
          navigatorKey: RM.navigate.navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: theme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          home: TestingPage(),
        ),
      );
}

final nursesRM = RM.inject(() => []);
final wardsRM = RM.inject(() => []);
