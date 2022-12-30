// ignore_for_file: prefer_typing_uninitialized_variables, constant_identifier_names

import 'package:google_fonts/google_fonts.dart';

import '../../core/themes.dart';

const LABEL_PRESCRIPTIONS_PAGE = 'PRESCRIPTIONS';
const LABEL_DASHBOARD_PAGE = 'DASHBOARD';
const LABEL_SETTINGS_PAGE = 'SETTINGS';

String googleFont(String fontFamily) {
  if (fonts.contains(fontFamily)) {
    return GoogleFonts.getFont(fontFamily).fontFamily!;
  } else {
    return 'Dosis';
  }
}
