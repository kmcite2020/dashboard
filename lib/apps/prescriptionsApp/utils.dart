// ignore_for_file: prefer_typing_uninitialized_variables, constant_identifier_names

import 'package:dashboard/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const LABEL_PRESCRIPTIONS_PAGE = 'PRESCRIPTIONS';
const LABEL_DASHBOARD_PAGE = 'DASHBOARD';
const LABEL_SETTINGS_PAGE = 'SETTINGS';

Color color([int? opacity]) {
  if (opacity != null) {
    // return manager.colorRM.state.withAlpha(opacity * 256 ~/ 1000);
  } else {
    // return manager.colorRM.state;
  }
  return Colors.black;
}

String googleFont(String fontFamily) {
  // if (manager.fonts.contains(fontFamily)) {
  //   return GoogleFonts.getFont(fontFamily).fontFamily!;
  // } else {
  //   return 'Dosis';
  // }
  return fontFamily;
}

ButtonStyle get buttonStyle {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all(color(200)),
    foregroundColor: MaterialStateProperty.all(color(900)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
