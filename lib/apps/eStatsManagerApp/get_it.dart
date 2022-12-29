import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

class SettingsManager {
  static final themeDataRM = RM.inject(
    () {
      return ThemeData(
          primarySwatch: colorRM.state,
          fontFamily: GoogleFonts.getFont(fontRM.state).fontFamily,
          useMaterial3: true,
          brightness: ThemeData.estimateBrightnessForColor(colorRM.state));
    },
    // persist: () => PersistState(
    //   key: "THEME_DATA",
    // ),
    dependsOn: DependsOn(
      {fontRM, themeModeRM},
    ),
  );
  static ThemeData getThemeData() => themeDataRM.state;
  static void setThemeData(value) => themeDataRM.state = value;
  static final themeModeRM = RM.inject(() => ThemeMode.system);
  static ThemeMode getThemeMode() => themeModeRM.state;
  static void setThemeMode(value) => themeModeRM.state = value;

  static final colorRM = RM.inject(() => colors.first);
  static final fontRM = RM.inject(() => fonts.first);
}

Iterable<String> get fonts => GoogleFonts.asMap().keys.take(16);
get colors => Colors.primaries;

final StreamController theme = StreamController<ThemeData>();
void themeDark() => theme.add(ThemeData.dark());

void themeLight() => theme.add(ThemeData.light());

Stream<MaterialColor> getColor(int index) async* {
  for (final color in Colors.primaries) {
    if (Colors.primaries.indexOf(color) == index) {
      yield color;
    }
  }
}

StreamController<int> indexRM = StreamController();
