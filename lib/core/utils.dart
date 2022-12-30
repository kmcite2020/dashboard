// ignore_for_file: prefer_const_constructors

import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

String googleFont(String font) {
  String fontFamily = 'Fira';
  for (final eachFont in GoogleFonts.asMap().keys) {
    if (eachFont == font) {
      fontFamily = GoogleFonts.getFont(font).fontFamily as String;
    }
  }
  return fontFamily;
}

String get randomID => Uuid().v1();
