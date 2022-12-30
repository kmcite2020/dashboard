// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unrelated_type_equality_checks, unused_local_variable, empty_statements, unused_import, avoid_print, must_be_immutable, unnecessary_null_comparison, sized_box_for_whitespace, prefer_typing_uninitialized_variables, dead_code,use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unrelated_type_equality_checks, unused_local_variable, empty_statements, unused_import, avoid_print, must_be_immutable, unnecessary_null_comparison, sized_box_for_whitespace, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, unnecessary_overrides, prefer_function_declarations_over_variables, duplicate_ignore, unused_element

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import '../../core/themes.dart';
import 'controllers/core.dart';
import 'veiws/dashboard.dart';
import 'veiws/drawer.dart';
import 'veiws/medicines.dart';
import 'veiws/prescriptions.dart';
import 'veiws/settings.dart';

clearAll() {
  Hive.box('data').clear();
  Hive.box('settings').clear();
  Hive.box('prescriptions').clear();
  Hive.box('medicines').clear();
}

class PrescriptionsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: Prescriptions(),
    );
  }
}
