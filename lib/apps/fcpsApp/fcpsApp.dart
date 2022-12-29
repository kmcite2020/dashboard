// ignore_for_file: prefer_const_constructors, unused_local_variable, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_import

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'core.dart';
import 'pages/dashboard.dart';
import 'pages/signin.dart';

final store = Hive.box('store');
const double roundedCornerRadius = 10;

// configs
class FcpsApp extends ReactiveStatelessWidget {
  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: dark ? Brightness.dark : Brightness.light,
      ),
      home: isLogged ? Dashboard() : SigninPage(),
    );
  }
}

open(BuildContext context, {page, bool replacement = false}) {
  if (replacement) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
  } else {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}

back(context) => Navigator.pop(context);
