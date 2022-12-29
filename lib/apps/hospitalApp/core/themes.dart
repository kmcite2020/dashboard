// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final theme = RM.injectTheme(
  isLazy: false,
  lightThemes: {
    "GREEN LAKE": ThemeData(
      useMaterial3: true,
      primaryColor: Colors.green,
    ),
    "BLUE HELL": ThemeData(
      useMaterial3: true,
      primaryColor: Colors.blue,
    ),
    "RED FIRE": ThemeData(
      useMaterial3: true,
      primaryColor: Colors.red,
    ),
    "CUSTOM JELLY": ThemeData(
      useMaterial3: true,
      sliderTheme: SliderThemeData(
        trackHeight: 8,
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: Colors.yellow[300],
      ),
      scaffoldBackgroundColor: Colors.yellow[800],
      // textTheme: TextTheme(
      //   displayLarge: GoogleFonts.getFont(fonts[font.value]),
      //   displayMedium: GoogleFonts.getFont(fonts[font.value]),
      //   displaySmall: GoogleFonts.getFont(fonts[font.value]),
      //   headlineLarge: GoogleFonts.getFont(fonts[font.value]),
      //   headlineMedium: GoogleFonts.getFont(fonts[font.value]),
      //   headlineSmall: GoogleFonts.getFont(fonts[font.value]),
      //   titleLarge: GoogleFonts.getFont(fonts[font.value]),
      //   titleMedium: GoogleFonts.getFont(fonts[font.value]),
      //   titleSmall: GoogleFonts.getFont(fonts[font.value]),
      //   bodyLarge: GoogleFonts.getFont(fonts[font.value]),
      //   bodyMedium: GoogleFonts.getFont(fonts[font.value]),
      //   bodySmall: GoogleFonts.getFont(fonts[font.value]),
      // ),
      listTileTheme: ListTileThemeData(shape: BeveledRectangleBorder()),
      popupMenuTheme: PopupMenuThemeData(
        shape: Border.all(color: Colors.green, width: 2),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.yellow,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      navigationBarTheme: const NavigationBarThemeData(
        indicatorColor: Colors.yellow,
      ),
      primaryColor: Colors.yellow,
    ),
  },
  darkThemes: {
    "GREEN LAKE": ThemeData(
      primaryColor: Colors.green,
      useMaterial3: true,
    ),
    "BLUE HELL": ThemeData(
      primaryColor: Colors.blue,
      useMaterial3: true,
    ),
    "RED FIRE": ThemeData(
      primaryColor: Colors.red,
      useMaterial3: true,
    ),
    "CUSTOM LILY": ThemeData(
      primaryColor: Colors.yellow,
      useMaterial3: true,
    )
  },
  persistKey: '__theme__',
);
