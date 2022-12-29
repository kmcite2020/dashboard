// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'features/home/home.dart';

class PrayersApp extends ReactiveStatelessWidget {
  const PrayersApp({super.key});

  @override
  Widget build(BuildContext context) => Home();
}

bool get authenticated {
  if (userID != null) {
    return true;
  } else {
    return false;
  }
}

final userIdRM = RM.inject<String?>(() => null);
String? get userID => userIdRM.state;
set userID(value) => userIdRM.state = value;

/// init start set loading
/// users init
/// data init
/// user init
/// loading screen
/// login
/// register
/// homeScreen


