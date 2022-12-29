import 'package:google_fonts/google_fonts.dart';

// USEFULL GETTERS AND FUNCTIONS
String googleFont(String font) {
  String fontFamily = 'Fira';
  for (final any in GoogleFonts.asMap().keys) {
    if (any == font) {
      fontFamily = GoogleFonts.getFont(font).fontFamily as String;
    }
  }
  return fontFamily;
}
