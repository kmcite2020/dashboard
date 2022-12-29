// ignore_for_file: must_be_immutable, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_import, prefer_typing_uninitialized_variables, use_build_context_synchronously, file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'home/home.dart';
import 'initialize.dart';
import 'settings/user_information.dart';
import 'core.dart';

class BeseechApp extends TopStatelessWidget {
  static open(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => BeseechApp()));
  }

  @override
  Widget build(BuildContext context) {
    return OnReactive(
      () => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: RM.navigate.navigatorKey,
        theme: ThemeData(
          scaffoldBackgroundColor: color.shade200,
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: color.shade100,
              border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10))),
          cardTheme: CardTheme(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          listTileTheme: ListTileThemeData(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          fontFamily: GoogleFonts.getFont(font).fontFamily,
          brightness: dark ? Brightness.dark : Brightness.light,
          useMaterial3: true,
          colorSchemeSeed: color,
        ),
        home: isInitialized ? Home() : Initialize(),
      ),
    );
  }
}
