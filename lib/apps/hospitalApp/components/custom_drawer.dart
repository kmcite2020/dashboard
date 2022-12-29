// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, must_be_immutable, prefer_const_constructors_in_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../core/i18n.dart';
import '../pages/archives_list.dart';
import '../pages/homepage.dart';
import '../pages/patients_list.dart';
import '../pages/settings.dart';
import '../pages/study.dart';
import '../core/themes.dart';
import 'patients_progress_bar.dart';
import 'widgets.dart';

class CustomDrawer extends ReactiveStatelessWidget {
  final label;

  CustomDrawer(this.label);
  @override
  Widget build(BuildContext context) {
    final i10n = i18n.of(context);
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(label),
                  UserInfo(),
                  SizedBox(height: 7),
                  ContainerButton(
                    onTap: () => RM.navigate.to(Homepage()),
                    label: Homepage.label,
                    icon: Homepage.icon,
                  ),
                  ContainerButton(
                    onTap: () => RM.navigate.to(PatientListView()),
                    label: PatientListView.label,
                    icon: PatientListView.icon,
                  ),
                  ContainerButton(
                    onTap: () => RM.navigate.to(Settings()),
                    label: i10n.settingsLabel,
                    icon: Settings.icon,
                  ),
                  ContainerButton(
                    onTap: () => RM.navigate.to(ArchivesList()),
                    label: ArchivesList.label,
                    icon: ArchivesList.icon,
                  ),
                  ContainerButton(
                    label: Study.label,
                    icon: Study.icon,
                    onTap: () => RM.navigate.to(Study()),
                  ),
                  PatientsProgressBar()
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text3('Copyrights Registered'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerButton extends ReactiveStatelessWidget {
  final VoidCallback? onTap;
  final String label;
  final Icon icon;
  final Color? color;
  ContainerButton({
    this.label = 'Button',
    this.icon = const Icon(Icons.smart_button),
    this.color,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: color ?? theme.activeTheme(theme.state).primaryColor,
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        // padding: EdgeInsets.all(12),
        // margin: EdgeInsets.all(6),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              icon,
              SizedBox(width: 6),
              Text(
                label,
                textScaleFactor: 1.3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends ReactiveStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Card(),
    );
  }
}
