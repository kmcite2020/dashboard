// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unrelated_type_equality_checks, unused_local_variable, empty_statements, unused_import, avoid_print, must_be_immutable, unnecessary_null_comparison, sized_box_for_whitespace, prefer_typing_uninitialized_variables, dead_code,use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unrelated_type_equality_checks, unused_local_variable, empty_statements, unused_import, avoid_print, must_be_immutable, unnecessary_null_comparison, sized_box_for_whitespace, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, unnecessary_overrides, prefer_function_declarations_over_variables, duplicate_ignore, unused_element, unused_field

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/themes.dart';
import '../controllers/core.dart';
import '../prescriptionsApp.dart';
import 'drawer.dart';
import 'medicines.dart';
import 'prescriptions.dart';

class Settings extends StatelessWidget {
  static const label = 'Settings';
  static const icon = Icon(Icons.settings);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                title: Text("settings"),
                actions: [BackButton()],
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'colors',
                      ),
                    ),
                    GridView.count(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 5,
                      childAspectRatio: 1,
                      // alignment: WrapAlignment.center,
                      children: [
                        for (final eachColor in Colors.primaries)
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              highlightColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                              hoverColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                              focusColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                              splashColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                              onTap: () {
                                color = eachColor;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: (eachColor == color) ? 3 : 1, color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                  color: eachColor,
                                  shape: BoxShape.rectangle,
                                ),
                                // height: size.height / 12,
                                // width: size.width / 6,
                                child: (eachColor == color)
                                    ? Icon(
                                        Icons.color_lens,
                                        color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.black : Colors.white,
                                        size: 40,
                                      )
                                    : Icon(Icons.color_lens),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('fonts'),
                  ),
                  GridView.count(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    childAspectRatio: 2.0,
                    children: [
                      for (final eachFont in fonts)
                        Padding(
                          padding: const EdgeInsets.all(3),
                          child: Card(
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            // color: eachFont == font
                            //     ? settingController.dark
                            //         ? Colors.black38
                            //         : Colors.white38
                            //     : colors[settingController.color],
                            child: InkWell(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              onTap: () => font = eachFont,
                              child: Padding(
                                padding: EdgeInsets.all(padding),
                                child: Center(
                                  child: Text(
                                    eachFont,
                                    softWrap: true,
                                    textScaleFactor: .8,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              // SwitchListTile(
              //   value: settingController.dark,
              //   onChanged: (value) => settingController.setDark(value),
              //   title: Text('dark'.tr),
              //   subtitle: Text('dark_info'.tr),
              // ),
              // ListTile(
              //   trailing: Switch(
              //     onChanged: (value) => settingController.setMaterial(value),
              //     value: settingController.material,
              //   ),
              //   onTap: () => settingController.setMaterial(!settingController.material),
              //   title: Text(
              //     'material'.tr,
              //   ),
              //   subtitle: Text("material_info".tr),
              // ),
              // ListTile(
              //   onTap: () => admin.value = !settingController.admin.value,
              //   title: Text('admin'.tr),
              //   subtitle: Text('admin_info'.tr),
              //   trailing: Switch(
              //     value: settingController.admin.value,
              //     onChanged: (value) => settingController.admin.value = value,
              //   ),
              // ),
              ListTile(
                onTap: () {
                  // Phoenix.rebirth(context);
                  // index = 0;
                },
                title: Text(
                  'restart_soft',
                ),
                subtitle: Text('restart_soft_info'),
              ),
              ListTile(
                // onTap: () => Restart.restartApp(),
                title: Text(
                  'restart_hard',
                ),
                subtitle: Text("restart_hard_info"),
              ),
              // settingController.admin.value
              //     ? ListTile(
              //         onTap: () {
              //           Get.to(() => Medicines());
              //         },
              //         title: Text(
              //           'medicines_add_more'.tr,
              //         ),
              //         subtitle: Text("medicines_add_more_info".tr),
              //       )
              // : SizedBox(),
              ListTile(
                onLongPress: () async {
                  await Hive.box('data').clear();
                  print('data cleared');
                  await Hive.box('settings').clear();
                  print('settings cleared');
                  await Hive.box('prescriptions').clear();
                  print('prescriptions cleared');
                },
                title: Text(
                  'restore',
                ),
                subtitle: Text('restore_info'),
              ),
              ListTile(
                title: Text(
                  'copyrights',
                ),
                subtitle: Text("copyrights_info"),
              ),
              AboutListTile(
                icon: Icon(Icons.info),
                applicationName: "app_name",
                applicationVersion: "app_version",
                applicationLegalese: "app_legalese",
                applicationIcon: Icon(Icons.health_and_safety),
                aboutBoxChildren: [
                  TextButton(
                    onPressed: () {},
                    child: Text('copyrights'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
