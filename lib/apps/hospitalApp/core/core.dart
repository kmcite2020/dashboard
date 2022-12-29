// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings, unused_import, override_on_non_overriding_member, avoid_print, prefer_typing_uninitialized_variables, avoid_init_to_null, unused_local_variable, avoid_function_literals_in_foreach_calls, invalid_use_of_protected_member, unnecessary_null_comparison, unused_field, constant_identifier_names

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:uuid/uuid.dart';

import '../components/investigations.dart';
import '../hospitalApp.dart';
import '../pages/archives_list.dart';
import '../pages/homepage.dart';
import '../pages/patient_admission_form.dart';
import '../pages/patient_details.dart';
import '../pages/patients_list.dart';
import '../pages/settings.dart';

///GLOBALIZED VARIABLES
// ///! COLORS SYSTEM - material
// // final color = RM.injectFormField<int>(0
// //  settings.get('color', defaultValue: 0)
//     // onValueChange: (formField) {
//     //   int value = formField.value;
//     //   print("COLOR: " + colors[value].toString());
//     //   settings.put('color', value);
//     // },
//     // autoDispose: false,
// //    );
final fonts = ['Fira Code', 'Open Sans'];
final font = RM.injectFormField<int>(
  0
  // settings.get('font', defaultValue: 0)
  ,
  onValueChange: (formField) {
    int value = formField.value;
    print("FONT: " + fonts[value]);
    // settings.put('font', value);
  },
  autoDispose: false,
);

//! MATERIAL - completed
final material = RM.inject<bool>(
  () => true,
  persist: () => PersistState(key: '__font__'),
  autoDisposeWhenNotUsed: false,
);

final InjectedFormField<bool> dark = RM.injectFormField<bool>(true
    // settings.get('dark', defaultValue: false),
    // onValueChange: (formField) {
    //   bool value = formField.value;
    //   print(
    //     "DARK: " + value.toString(),
    //   );
    //   settings.put('dark', value);
    // },
    // autoDispose: false,
    );

//![EDIT ADMISSION CAPACITY]
final admissionsCapacity = RM.injectFormField<double>(10.0
    // settings.get('admissionsCapacity', defaultValue: 10.0),
    // onValueChange: (formField) {
    //   double value = formField.value;
    //   print(value);
    //   settings.put('admissionCapacity', value);
    // },
    // autoDispose: false,
    );

///! SET HOSPITAL / USER / DEPARTMENT
final userForm = RM.injectForm(
  autovalidateMode: AutovalidateMode.always,
  submit: () async {
    // settings.put('hospital', hospital.value);
    // settings.put('doctor', doctor.value);
    // settings.put('ward', ward.value);
  },
);
final doctor = RM.injectTextEditing(
  text: '',
  //  settings.get('doctor') ?? 'DR. HOUSE',
  // onTextEditing: (textEditing) {
  //   settings.put('doctor', textEditing.value.toUpperCase());
  // },
  autoDispose: false,
);

//WARD
// final ward = RM.injectTextEditing(
//     text: settings.get('ward') ?? 'MEDICAL DIAGNOSTICS',
//     onTextEditing: (textEditing) => settings.put('ward', textEditing.value.toUpperCase()),
//     autoDispose: false);
// final hospital = RM.injectFormField(
//   settings.get('hospital') ?? 'MEDICAL DIAGNOSTICS',
//   onValueChange: (formField) {
//     String value = formField.value;
//     settings.put('hospital', value.toUpperCase());
//   },
//   autoDispose: false,
// );

setGender(patient) {
  patient.gender = !patient.gender;
}

decreaseAge(patient) => patient--;
increaseAge(patient) => patient++;

// change vital status
setVitals(patient) {
  // patient.vitals = !patient.vitals;
}

// wards info
bool isNoBedAvailable = false;
// implement for new admissions if no space available

final _patientList = [].inj();
get patientList => _patientList.state;
final _archivedPatientList = [].inj();
get archivedPatientList => _archivedPatientList.state;

void dischargePatient(patientID) {
  // admittedPatients.delete(patientID);
  // patients.keys = [
  //   for (final pt in patients.state)
  //     if (pt.id != patient.id) pt
  // ];

  // _archivedPatientList.state = [..._archivedPatientList.state, patient];
}

void deletePatientFromArchives(patient) => _archivedPatientList.state = [
      for (final pt in _archivedPatientList.state)
        if (pt.id != patient.id) pt
    ];

/// PATIENT MANIPULATION
// final id = RM.inject(
//   () => '',
//   // validators: [
//   //   (value) {
//   //     if (value == '') {
//   //       return 'Required field';
//   //     } else {
//   //       return null;
//   //     }
//   //   },
//   // ],
// );
// final nameController = RM.injectTextEditing(text: '');
// final ageController = RM.injectFormField<double>(20);
// final genderController = RM.injectFormField<bool>(false);

// final presentingComplaintsController = RM.injectTextEditing(text: '');
// final activeComplaintsController = RM.injectTextEditing(text: '');
// final historyController = RM.injectTextEditing(text: '');
// final examinationsController = RM.injectTextEditing(text: '');
// final systolicBP = RM.injectFormField<double>(120);
// final diastolicBP = RM.injectFormField<double>(80);
// final pulseController = RM.injectFormField<double>(72.0);
// final temperatureController = RM.injectFormField<double>(96.4);
// final saturationController = RM.injectFormField<double>(98.0);
// final investigationsController = RM.injectTextEditing(text: '');
// final diagnosisController = RM.injectTextEditing(text: '');
// final managementController = RM.injectTextEditing(text: '');

// investigations implementation

class Patient {
  final id;
  final String name;
  final String disease;
  final int pulse;

  Patient(this.id, this.name, this.disease, this.pulse);
  @override
  String toString() {
    return '$id, $name, $disease, $pulse';
  }
}

final name = RM.inject<String>(() => '');
final disease = RM.inject<String>(() => '');
final pulse = RM.inject<int>(() => 0);
final patients = RM.inject<Map<String, Patient>>(
  () {
    return {};
  },
  dependsOn: DependsOn(
    {name, disease, pulse},
  ),
  persist: () => PersistState(
    toJson: (patients) {
      return jsonEncode(
        {
          for (final patient in patients.values)
            patient.id: {
              'id': patient.id,
              'name': patient.name,
              'pulse': patient.pulse,
              'disease': patient.disease,
            },
        },
      );
    },
    fromJson: (json) {
      Map<String, Patient> toPopulate = {};
      for (final Map patient in jsonDecode(json).values) {
        toPopulate.addAll(
          {
            patient['id']: Patient(
              patient['id'],
              patient['name'],
              patient['disease'],
              patient['pulse'],
            ),
          },
        );
      }

      return toPopulate;
    },
    key: '__patient__',
  ),
);

void admitPatient() {
  // // _patientList.state = [..._patientList.state, patient];

  // log('admitting');
  // var id = Uuid().v4();
  // log(id);
  // admittedPatients.put(
  //   id,
  //   {
  //     'id': id,
  //     'name': nameController.text, //
  //     'age': ageController.state, //
  //     'gender': genderController.state,
  //     'presenting complaints': presentingComplaintsController.text,
  //     'active complaints': activeComplaintsController.text,
  //     'history': historyController.text,
  //     'examinations': examinationsController.text,
  //     'blood pressure': '${systolicBP.state}/${diastolicBP.state}', //
  //     'temperature': temperatureController.state, //
  //     'pulse': pulseController.state, //
  //     'saturation': saturationController.state, //
  //     'investigations': investigationsMap,
  //     'management': managementController.text,
  //     'diagnosis': diagnosisController.text,
  //   },
  // );
  // log(admittedPatients.values.toString());
}

void readmitPatient() {
  // _archivedPatientList.state = [
  //   for (final pt in _archivedPatientList.state)
  //     if (pt.id != patient.id) pt
  // ];
  // _patientList.state = [..._patientList.state, patient];
}
