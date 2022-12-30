// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:dashboard/apps/prayersApp/features/authentication/authentication.dart';
import 'package:dashboard/apps/prayersApp/features/authentication/login/login.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'features/home/home.dart';

class PrayersApp extends ReactiveStatelessWidget {
  const PrayersApp({super.key});

  @override
  Widget build(BuildContext context) => authenticated ? Home() : LoginForm();
}

bool get authenticated {
  if (currentUser != null) {
    return true;
  } else {
    return false;
  }
}


/// init start set loading
/// users init
/// data init
/// user init
/// loading screen
/// login
/// register
/// homeScreen


