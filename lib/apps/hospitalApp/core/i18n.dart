// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final i18n = RM.injectI18N<EnUS>(
  {
    Locale('en', 'US'): () => EnUS(),
  },
  persistKey: '__lang__',
);

class EnUS {
  final settingsLabel = 'SETTINGS';
  final deleteEverything = 'DELETE EVERYTHING';
  final deleteArchives = 'DELETE ARCHIVES';
  final userInfo = 'USER INFORMATIONS';
  final deletePatients = 'DELETE PATIENTS';
  final dashboardLabel = 'DASHBOARD';
  final archiveLabel = 'ARCHIVES';
  final homepageLabel = 'HOME';
  final themes = 'THEMES';
  final greenTheme = 'GREEN Theme';
  final blueTheme = 'BLUE Theme';
  final redTheme = 'RED Theme';
  final customTheme = 'CUSTOM Theme';

  final toggleDarkMode = 'Toggle Dark mode';
  final useSystemMode = 'Use system mode';
  final systemLanguage = 'System Language';
  //
  String counterTimes(int count) {
    if (count == 0) {
      return 'Zero times';
    }
    if (count == 1) {
      return 'One time';
    }
    return '$count times';
  }
}
