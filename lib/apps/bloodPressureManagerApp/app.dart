// ignore_for_file: override_on_non_overriding_member, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'testUI/ui.dart';

class BloodPressureManagerApp extends TopStatelessWidget {
  const BloodPressureManagerApp({Key? key}) : super(key: key);

  @override
  ensureInitialization() => [
        Future.delayed(
          Duration(
            seconds: 2,
          ),
        ),
        // RM.storageInitializer(HiveStore())
      ];
  @override
  splashScreen() => OnReactive(
        () => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SafeArea(
            top: false,
            child: Scaffold(
              body: Center(
                child: Icon(
                  Icons.store_sharp,
                  size: 250,
                ),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      navigatorKey: RM.navigate.navigatorKey,
      home: TestUI(),
    );
  }
}
