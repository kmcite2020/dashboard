// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, no_leading_underscores_for_local_identifiers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard.dart';
import 'medicines.dart';
import 'prescriptions.dart';
import 'settings.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 2,
            ),
            AppBar(),
            DrawerItem1(
                label: "dashboard".tr,
                onTap: () {
                  Get.back();
                  Get.to(() => Dashboard());
                }),
            DrawerItem1(
                label: "prescriptions".tr,
                onTap: () {
                  Get.back();
                  Get.to(() => Prescriptions());
                }),
            DrawerItem1(
              label: "settings".tr,
              onTap: () {
                Get.back();
                Get.to(() => Settings());
              },
            ),
            DrawerItem1(
              label: "medicine".tr,
              onTap: () {
                Get.back();
                Get.to(() => Medicines());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem1 extends StatelessWidget {
  const DrawerItem1({
    Key? key,
    this.label = 'Hello World..!',
    this.onTap,
  }) : super(key: key);
  final String label;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(label),
        ),
      ),
    );
  }
}
