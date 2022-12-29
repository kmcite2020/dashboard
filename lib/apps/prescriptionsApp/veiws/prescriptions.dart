// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unrelated_type_equality_checks, unused_local_variable, empty_statements, unused_import, avoid_print, must_be_immutable, unnecessary_null_comparison, sized_box_for_whitespace, prefer_typing_uninitialized_variables, non_constant_identifier_names, dead_code, await_only_futures

import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

List<String> frequencies = [
  'STAT',
  'OD',
  'BD',
  'TDS',
  'QID',
];
List<String> doses = [
  '1mg',
  '2mg',
  '5mg',
  '10mg',
  '20mg',
  '30mg',
  '50mg',
  '100mg',
  '250mg',
  '500mg',
  '1g',
  '2g',
];
List<String> formulations = [
  'Inj.',
  'Syp.',
  'Tab.',
  'Cap.',
];
List<String> routes = [
  'IV',
  'IM',
  'P/NG',
  'P/O',
  'S/C',
  'S/L',
];

class Prescription {
  final String prescriptionId; // for delete and edit support
  final Patient name; // patient name to whom this prescription is given
  final List content; // list of medicines or instructions advised
  final DateTime date; // when prescription was advised
  final Diagnosis diagnosis; // why prescribed
  final Doctor doctor; // who prescribed
  Prescription(this.name, this.prescriptionId, this.content, this.date, this.diagnosis, this.doctor);
  @override
  String toString() {
    return 'PRESCRIPTION $name, $prescriptionId, $content, $date, $diagnosis, $doctor';
  }
}

class Doctor {
  final String doctorId;
  final String name;
  final String department;
  final String hospital;

  Doctor(this.doctorId, this.name, this.department, this.hospital);
}

class Diagnosis {
  final diagnosisId;
  final name;
  final description;

  Diagnosis(this.diagnosisId, this.name, this.description);
}

class Patient {}

class PrescriptionController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await Hive.openBox('prescriptions');
    prescriptions.value = await Hive.box('prescriptions').toMap();
  }

  final tempPRESCRIPTIONlistCONTENT = [].obs;
  final prescriptions = {}.obs;
  final formulation = formulations.first.obs;
  final dose = doses.first.obs;
  final route = routes.first.obs;
  final frequency = frequencies.first.obs;
  final effects = ''.obs;
  final notes = ''.obs;
  final medicine = ''.obs;
  void addPresctoList() {
    tempPRESCRIPTIONlistCONTENT.value = [
      ...tempPRESCRIPTIONlistCONTENT,
    ];
  }

  // RxString get medicine => medicines.isEmpty ? 'No medicines'.obs : medicines.first.obs;
  addPrescription(id) {
    prescriptions[id] = {
      "id": id,
      "formulation": formulation.value,
      "dose": dose.value,
      "medicine": medicine.value,
      "route": route.value,
      "frequency": frequency.value,
      "effect": effects.value,
      "note": notes.value
    };
    Hive.box('prescriptions').put(id, prescriptions[id]);
  }

  deletePrescription(String prescription) {
    prescriptions.remove(prescription);
    Hive.box('prescriptions').delete(prescription);
  }
}

class Prescriptions extends StatelessWidget {
  SettingController settingController = Get.find();
  MedicineController medicineController = Get.find();
  PrescriptionController prescriptionController = Get.find();
  @override
  Widget build(BuildContext context) {
    const double size = 18;
    return Obx(
      () => Scaffold(
        drawer: CustomDrawer(),
        body: SafeArea(
          child: ListView(
            children: [
              AppBar(
                title: Text('prescriptions'.tr),
              ),
              SizedBox(height: 5),
              for (final prescription in prescriptionController.prescriptions.values)
                InkWell(
                  highlightColor: colors[settingController.color][400],
                  hoverColor: colors[settingController.color][200],
                  focusColor: colors[settingController.color][500],
                  splashColor: colors[settingController.color][800],
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    Get.to(PrescriptionInfo(id: prescription['id']));
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      shape: BoxShape.rectangle,
                      color: colors[settingController.color][400],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            prescription['formulation'] +
                                ' ' +
                                prescription["medicine"] +
                                ' ' +
                                prescription["dose"] +
                                " " +
                                prescription["route"] +
                                ' ' +
                                prescription["frequency"],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            prescriptionController.deletePrescription(prescription['id']);
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
          onPressed: () => Get.to(
            () => AddPrescription(),
          ),
          icon: Icon(Icons.add_box),
          label: Text('Add Prescription'),
        ),
      ),
    );
  }
}

class MedicineController {}
