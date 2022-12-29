// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings, unused_import, duplicate_import, depend_on_referenced_packages, unused_local_variable, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, must_be_immutable, unused_field, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:states_rebuilder/states_rebuilder.dart';

import '../components/custom_drawer.dart';
import '../components/widgets.dart';
import '../core/core.dart';
import '../core/i18n.dart';
import '../core/themes.dart';
import 'patient_admission_form.dart';

late BuildContext context;

class Settings extends ReactiveStatelessWidget {
  Settings({Key? key}) : super(key: key);
  static const icon = Icon(Icons.settings);
  @override
  void didMountWidget(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final _i18n = i18n.of(context);
    return Scaffold(
      drawer: CustomDrawer(_i18n.settingsLabel),
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text3('Settings'),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Text2(_i18n.themes),
              for (final lightTheme in theme.supportedLightThemes.keys)
                ContainerButton(
                  color: theme.activeTheme(lightTheme).primaryColor,
                  onTap: () => theme.state = lightTheme,
                  label: lightTheme,
                ),
              // for (final darkTheme in theme.supportedDarkThemes.keys)
              //   ContainerButton(
              //     color: theme.activeTheme(darkTheme).primaryColor,
              //     onTap: () => theme.state = darkTheme,
              //     label: darkTheme,
              //   ),
              Text2(theme.state),
              Text2("${admissionsCapacity.value.toInt()}"),
              Slider(
                label: "${admissionsCapacity.value.toInt()}",
                min: 0,
                max: 100,
                focusNode: admissionsCapacity.focusNode,
                value: admissionsCapacity.value,
                onChanged: (value) {
                  admissionsCapacity.value = value;
                },
              ),
              UserInfo(),
              ListTile(
                title: Text3('DELETE PATIENTS'),
                // color: Color.fromARGB(255, 224, 92, 92),
                subtitle: Text3('deletes data from patients list.'),
                onLongPress: () => RM.scaffold.showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    duration: Duration(seconds: 2),
                    content: Center(heightFactor: 4, child: Text3('ALL PATIENTS ARE DELETED FROM DATABASE')),
                  ),
                ),
              ),
              ListTile(
                title: Text3('DELETE ARCHIVES'),
                // color: Color.fromARGB(255, 196, 97, 97),
                subtitle: Text3('deletes data from archives'),
                onLongPress: () => RM.scaffold.showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    duration: Duration(seconds: 2),
                    content: Center(heightFactor: 4, child: Text3('ALL DATA FROM ARCHIVES IS DELETED')),
                  ),
                ),
              ),
              ListTile(
                title: Text3('DELETE EVERYTHING'),
                subtitle: Text3('configures everything to defaults, like re-installing from scratch.'),
                // color: Color.fromARGB(255, 253, 0, 0),
                onLongPress: () {
                  RM.scaffold.showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(8),
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      duration: Duration(seconds: 2),
                      content: Center(heightFactor: 4, child: Text3('DATA IS COMPLETELY DESTROYED')),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfo extends ReactiveStatelessWidget {
  final edit = false.inj(autoDisposeWhenNotUsed: false);
  @override
  Widget build(BuildContext context) {
    return edit.state
        ? Container(
            //EDIT
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1),
            ),
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            child: OnFormBuilder(
                listenTo: userForm,
                builder: () {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(child: Text3('USER INFORMATIONS')),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    edit.toggle();
                                  },
                                  icon: Icon(Icons.cancel)),
                              IconButton(
                                  onPressed: () {
                                    userForm.submit();
                                    edit.toggle();
                                  },
                                  icon: Icon(Icons.done)),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          decoration: InputDecoration(labelText: 'DOCTOR'),
                          controller: doctor.controller,
                          focusNode: doctor.focusNode,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextField(
                          decoration: InputDecoration(labelText: 'DEPARTMENT'),
                          // controller: ward.controller,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'HOSPITAL'),
                          // initialValue: hospital.value,
                          // onChanged: hospital.onChanged,
                        ),
                      ),
                    ],
                  );
                }),
          )
        : Container(
            //READ
            decoration: BoxDecoration(
              // color: Colors.amber,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1),
            ),
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('USER INFORMATIONS'),
                    IconButton(
                        onPressed: () {
                          edit.toggle();
                          doctor.focusNode.requestFocus();
                        },
                        icon: Icon(Icons.edit)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DOCTOR',
                      textScaleFactor: .8,
                    ),
                    Text(doctor.text),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DEPARTMENT',
                      textScaleFactor: .8,
                    ),
                    // Text(ward.text),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'HOSPITAL',
                      textScaleFactor: .8,
                    ),
                    // Text(hospital.value),
                  ],
                ),
              ],
            ),
          );
  }
}
