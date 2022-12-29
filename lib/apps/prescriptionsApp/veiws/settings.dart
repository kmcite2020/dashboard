// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unrelated_type_equality_checks, unused_local_variable, empty_statements, unused_import, avoid_print, must_be_immutable, unnecessary_null_comparison, sized_box_for_whitespace, prefer_typing_uninitialized_variables, dead_code,use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unrelated_type_equality_checks, unused_local_variable, empty_statements, unused_import, avoid_print, must_be_immutable, unnecessary_null_comparison, sized_box_for_whitespace, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, unnecessary_overrides, prefer_function_declarations_over_variables, duplicate_ignore, unused_element, unused_field

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/themes.dart';
import '../controllers/core.dart';
import '../prescriptionsApp.dart';
import 'drawer.dart';
import 'medicines.dart';
import 'prescriptions.dart';

final _hive = Hive.box('settings');

class SettingController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final admin = false.obs;
  final _color = Rx(_hive.get("color") ?? 0);
  int get color => _color.value;
  void setColor(MaterialColor value) {
    _color.value = colors.indexOf(value);
    _hive.put("color", _color.value);
  }

  final _font = Rx(_hive.get("font") ?? 0);
  int get font => _font.value;
  void setFont(value) {
    _font.value = fonts.indexOf(value);
    _hive.put("font", _font.value);
  }

  final _dark = Rx(_hive.get("dark") ?? false);
  bool get dark => _dark.value;
  void setDark(value) {
    _dark.value = value;
    _hive.put("dark", _dark.value);
  }

  final _material = Rx(_hive.get("material") ?? false);
  bool get material => _material.value;
  void setMaterial(bool value) {
    _material.value = value;
    _hive.put("color", _material.value);
  }
}

class Settings extends StatelessWidget {
  final SettingController settingController = Get.put(SettingController());

  static const label = 'Settings';
  static const icon = Icon(Icons.settings);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        drawer: CustomDrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  title: Text("settings".tr),
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
                          'colors'.tr,
                        ),
                      ),
                      GridView.count(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 5,
                        childAspectRatio: 1,
                        // alignment: WrapAlignment.center,
                        children: [
                          for (final selectedColor in Colors.primaries)
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                highlightColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                hoverColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                focusColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                splashColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                onTap: () {
                                  settingController.setColor(selectedColor);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(width: (selectedColor == colors[settingController.color]) ? 3 : 1, color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                    color: selectedColor,
                                    shape: BoxShape.rectangle,
                                  ),
                                  // height: size.height / 12,
                                  // width: size.width / 6,
                                  child: (selectedColor == Colors.primaries[settingController.color])
                                      ? Icon(
                                          Icons.color_lens,
                                          color: settingController.dark ? Colors.black : Colors.white,
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
                      child: Text('fonts'.tr),
                    ),
                    GridView.count(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      childAspectRatio: 2.0,
                      children: [
                        for (final currentFont in fonts)
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Card(
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              color: currentFont == settingController.font
                                  ? settingController.dark
                                      ? Colors.black38
                                      : Colors.white38
                                  : colors[settingController.color],
                              child: InkWell(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                onTap: () => settingController.setFont(currentFont),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Center(
                                    child: Text(
                                      currentFont,
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
                SwitchListTile(
                  value: settingController.dark,
                  onChanged: (value) => settingController.setDark(value),
                  title: Text('dark'.tr),
                  subtitle: Text('dark_info'.tr),
                ),
                ListTile(
                  trailing: Switch(
                    onChanged: (value) => settingController.setMaterial(value),
                    value: settingController.material,
                  ),
                  onTap: () => settingController.setMaterial(!settingController.material),
                  title: Text(
                    'material'.tr,
                  ),
                  subtitle: Text("material_info".tr),
                ),
                ListTile(
                  onTap: () => settingController.admin.value = !settingController.admin.value,
                  title: Text('admin'.tr),
                  subtitle: Text('admin_info'.tr),
                  trailing: Switch(
                    value: settingController.admin.value,
                    onChanged: (value) => settingController.admin.value = value,
                  ),
                ),
                ListTile(
                  onTap: () {
                    // Phoenix.rebirth(context);
                    // index = 0;
                  },
                  title: Text(
                    'restart_soft'.tr,
                  ),
                  subtitle: Text('restart_soft_info'.tr),
                ),
                ListTile(
                  // onTap: () => Restart.restartApp(),
                  title: Text(
                    'restart_hard'.tr,
                  ),
                  subtitle: Text("restart_hard_info"),
                ),
                settingController.admin.value
                    ? ListTile(
                        onTap: () {
                          Get.to(() => Medicines());
                        },
                        title: Text(
                          'medicines_add_more'.tr,
                        ),
                        subtitle: Text("medicines_add_more_info".tr),
                      )
                    : SizedBox(),
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
                    'restore'.tr,
                  ),
                  subtitle: Text('restore_info'.tr),
                ),
                ListTile(
                  title: Text(
                    'copyrights'.tr,
                  ),
                  subtitle: Text("copyrights_info".tr),
                ),
                AboutListTile(
                  icon: Icon(Icons.info),
                  applicationName: "app_name".tr,
                  applicationVersion: "app_version".tr,
                  applicationLegalese: "app_legalese".tr,
                  applicationIcon: Icon(Icons.health_and_safety),
                  aboutBoxChildren: [
                    TextButton(
                      onPressed: () {},
                      child: Text('copyrights'.tr),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
