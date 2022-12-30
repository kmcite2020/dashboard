// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unrelated_type_equality_checks, unused_local_variable, empty_statements, unused_import, avoid_print, must_be_immutable, unnecessary_null_comparison, sized_box_for_whitespace, prefer_typing_uninitialized_variables, non_constant_identifier_names, dead_code, await_only_futures

import 'dart:developer';
import 'dart:math';

import 'package:dashboard/core/apps.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../core/themes.dart';
import '../controllers/core.dart';
import '../prescriptionsApp.dart';
import 'account_manager.dart';
import 'add_prescription.dart';
import 'drawer.dart';
import 'medicines.dart';
import 'prescription_info.dart';
import 'settings.dart';

class Prescriptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double size = 18;
    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
        child: ListView(
          children: [
            AppBar(
              title: Text('prescriptions'),
              actions: [AppSelectorToggle()],
            ),
            SizedBox(height: 5),
            for (final prescription in prescriptions)
              InkWell(
                // highlightColor: colors[settingController.color][400],
                // hoverColor: colors[settingController.color][200],
                // focusColor: colors[settingController.color][500],
                // splashColor: colors[settingController.color][800],
                // borderRadius: BorderRadius.circular(5),
                onTap: () {
                  // Get.to(PrescriptionInfo(id: prescription['id']));
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                    shape: BoxShape.rectangle,
                    // color: colors[settingController.color][400],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 8),
                      //   child: Text(
                      //     prescription['formulation'] +
                      //         ' ' +
                      //         prescription["medicine"] +
                      //         ' ' +
                      //         prescription["dose"] +
                      //         " " +
                      //         prescription["route"] +
                      //         ' ' +
                      //         prescription["frequency"],
                      //   ),
                      // ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // deletePrescription(prescription['id']);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            // Text(prescription['dose'].toString())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Get.to(
          // () => AddPrescription(),
          // );
        },
        icon: Icon(Icons.add_box),
        label: Text('Add Prescription'),
      ),
    );
  }
}
