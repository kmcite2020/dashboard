// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, no_leading_underscores_for_local_identifiers, use_key_in_widget_constructors

import 'package:flutter/material.dart';

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
                label: "dashboard",
                onTap: () {
                  // Get.back();
                  // Get.to(() => Dashboard());
                }),
            DrawerItem1(
                label: "prescriptions",
                onTap: () {
                  // Get.back();
                  // Get.to(() => Prescriptions());
                }),
            DrawerItem1(
              label: "settings",
              onTap: () {
                // Get.back();
                // Get.to(() => Settings());
              },
            ),
            DrawerItem1(
              label: "medicine",
              onTap: () {
                // Get.back();
                // Get.to(() => Medicines());
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
