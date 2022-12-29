// ignore_for_file: prefer_const_constructors

import 'package:dashboard/apps/beseechApp/beseechApp.dart';
import 'package:dashboard/apps/bloodPressureManagerApp/app.dart';
import 'package:dashboard/apps/eStatsManagerApp/eStatsManagerApp.dart';
import 'package:dashboard/apps/fcpsApp/fcpsApp.dart';
import 'package:dashboard/apps/fontsApp/FontsApp.dart';
import 'package:dashboard/apps/googleFontsViewerApp/googleFontsViewerApp.dart';
import 'package:dashboard/apps/hmisApp/hmisApp.dart';
import 'package:dashboard/apps/settingsApp/settingsApp.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../apps/commonSymptomsApp/commonSymptomsApp.dart';
import '../apps/hospitalApp/hospitalApp.dart';
import '../apps/idealApp/ui/dashboard.dart';
import '../apps/prayerApp/prayerApp.dart';
import '../apps/prescriptionsApp/prescriptionsApp.dart';
import '../apps/quizApp/quizApp.dart';
import '../apps/quizManagerApp/quizManagerApp.dart';
import '../apps/taskManagerApp/taskManagerApp.dart';
import '../apps/timerApp/timerApp.dart';
import '../apps/todoApp/todoApp.dart';

enum Apps {
  beseechApp,
  bloodPressureManagerApp,
  commonSymptomsApp,
  eStatsManagerApp,
  fcpsApp,
  fontsApp,
  googleFontsViewerApp,
  hmisApp,
  hospitalApp,
  idealApp,
  prayersApp,
  prescriptionsApp,
  quizApp,
  quizManagerApp,
  settingsApp,
  taskManagerApp,
  timerApp,
  todoApp,
}

Widget get runSelectedApp {
  switch (app.state) {
    case Apps.idealApp:
      return Dashboard();
    case Apps.quizApp:
      return const QuizApp();
    case Apps.timerApp:
      return TimerApp();
    case Apps.quizManagerApp:
      return const QuizManagerApp();
    case Apps.prayersApp:
      return PrayersApp();
    case Apps.commonSymptomsApp:
      return const CommonSymptomsApp();
    case Apps.hospitalApp:
      return HospitalApp;
    case Apps.prescriptionsApp:
      return PrescriptionsApp();
    case Apps.beseechApp:
      return BeseechApp();
    case Apps.bloodPressureManagerApp:
      return BloodPressureManagerApp();
    case Apps.eStatsManagerApp:
      return EStatesManagerApp();
    case Apps.hmisApp:
      return HMIS();
    case Apps.settingsApp:
      return SettingsApp();
    case Apps.taskManagerApp:
      return TaskManagerApp();
    case Apps.todoApp:
      return TodoApp();
    case Apps.fcpsApp:
      return FcpsApp();
    case Apps.fontsApp:
      return FontsApp();
    case Apps.googleFontsViewerApp:
      return GoogleFontsViewerApp();
  }
}

final app = RM.inject<Apps>(
  () => Apps.idealApp,
  // persist: () => PersistState(
  //   key: '___CURRENT_APP___',
  //   toJson: (s) => jsonEncode(Apps.values.indexOf(s)),
  //   fromJson: (json) => Apps.values[jsonDecode(json)],
  // ),
);
final hide = RM.inject<bool>(
  () => false,
  persist: () => PersistState(
    key: 'SHOW THE MAIN CONTROLLER THROUGH WHICH DIFFERENT APPS RUN',
  ),
);

class HideAppSelector extends ReactiveStatelessWidget {
  const HideAppSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(tooltip: 'show app selector', onPressed: () => hide.toggle(), icon: const Icon(Icons.app_settings_alt)),
    );
  }
}
