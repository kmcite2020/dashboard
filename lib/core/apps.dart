// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../apps/beseechApp/beseechApp.dart';
import '../apps/bloodPressureManagerApp/bloodPressureManagerApp.dart';
import '../apps/commonSymptomsApp/commonSymptomsApp.dart';
import '../apps/prayersApp/features/authentication/authentication.dart';
import '../apps/userManagerApp/userManagerApp.dart';
import '../apps/FCPS/FCPS.dart';
import '../apps/HiveDB/hiveDB.dart';
import '../apps/googleFontsViewerApp/googleFontsViewerApp.dart';
import '../apps/hmisApp/hmisApp.dart';
import '../apps/hospitalApp/hospitalApp.dart';
import '../apps/idealApp/ui/dashboard.dart';
import '../apps/prayersApp/prayerApp.dart';
import '../apps/prescriptionsApp/prescriptionsApp.dart';
import '../apps/quizApp/quizApp.dart';
import '../apps/quizManagerApp/quizManagerApp.dart';
import '../apps/settingsApp/settingsApp.dart';
import '../apps/taskManagerApp/taskManagerApp.dart';
import '../apps/timerApp/timerApp.dart';
import '../apps/todoApp/todoApp.dart';
import 'themes.dart';

final appRM = RM.inject<Apps>(
  () => Apps.hiveDB,
  // persist: () => PersistState(
  //   key: '___CURRENT_APP___',
  //   toJson: (s) => jsonEncode(Apps.values.indexOf(s)),
  //   fromJson: (json) => Apps.values[jsonDecode(json)],
  // ),
);
Apps get app => appRM.state;
set app(value) => appRM.state = value;
final hide = RM.inject<bool>(
  () => false,
  persist: () => PersistState(
    key: 'hide_selector',
  ),
);

enum Apps {
  beseechApp('Beseech'),
  bloodPressureManagerApp('Blood Pressure Manager'),
  commonSymptomsApp('Common Symptoms'),
  userManagerApp('User Manager'),
  fcpsApp('FCPS'),
  hiveDB('Hive DB Explorer'),
  googleFontsViewerApp('Google Fonts Viewer'),
  hmisApp('HMIS'),
  hospitalApp('Hospital'),
  idealApp('URideal Store'),
  prayersApp('Prayers'),
  prescriptionsApp('Prescriptions'),
  quizApp('Quiz'),
  quizManagerApp('Quiz Manager - for Quiz App'),
  settingsApp('Settings'),
  taskManagerApp('Task Manager'),
  timerApp('Timer'),
  todoApp('To-do');

  const Apps(this.description);
  final String description;
}

Widget get runSelectedApp {
  switch (app) {
    case Apps.idealApp:
      return Dashboard();
    case Apps.quizApp:
      return QuizApp();
    case Apps.timerApp:
      return TimerApp();
    case Apps.quizManagerApp:
      return QuizManagerApp();
    case Apps.prayersApp:
      return PrayersApp();
    case Apps.commonSymptomsApp:
      return CommonSymptomsApp();
    case Apps.hospitalApp:
      return hospitalApp;
    case Apps.prescriptionsApp:
      return PrescriptionsApp();
    case Apps.beseechApp:
      return BeseechApp();
    case Apps.bloodPressureManagerApp:
      return BloodPressureManagerApp();
    case Apps.userManagerApp:
      return UserManagerApp();
    case Apps.hmisApp:
      return HMIS();
    case Apps.settingsApp:
      return SettingsApp();
    case Apps.taskManagerApp:
      return TaskManagerApp();
    case Apps.todoApp:
      return TodoApp();
    case Apps.fcpsApp:
      return FCPS();
    case Apps.hiveDB:
      return HiveDB();
    case Apps.googleFontsViewerApp:
      return GoogleFontsViewerApp();
  }
}

class AppSelectorToggle extends ReactiveStatelessWidget {
  const AppSelectorToggle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
          tooltip: 'all available apps',
          onPressed: () => hide.toggle(),
          icon: Icon(hide.state ? Icons.arrow_circle_down : Icons.arrow_circle_up)),
    );
  }
}

class AppSelector extends ReactiveStatelessWidget {
  const AppSelector({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (hide.state) {
      return SizedBox();
    } else {
      return Padding(
        padding: EdgeInsets.all(padding),
        child: DropdownButtonFormField(
          icon: Icon(currentUser != null ? Icons.check : Icons.cancel),
          value: app,
          items: Apps.values
              .map(
                (eachApp) => DropdownMenuItem(
                  value: eachApp,
                  child: Text(eachApp.description),
                ),
              )
              .toList(),
          onChanged: (value) {
            app = value;
          },
        ),
      );
    }
  }
}
