// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unrelated_type_equality_checks, unused_local_variable, empty_statements, unused_import, avoid_print, must_be_immutable, unnecessary_null_comparison, sized_box_for_whitespace, prefer_typing_uninitialized_variables, dead_code,use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unrelated_type_equality_checks, unused_local_variable, empty_statements, unused_import, avoid_print, must_be_immutable, unnecessary_null_comparison, sized_box_for_whitespace, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, unnecessary_overrides, prefer_function_declarations_over_variables, duplicate_ignore, unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../veiws/add_prescription.dart';
import '../prescriptionsApp.dart';
import '../veiws/prescriptions.dart';
import '../veiws/settings.dart';

final data = Hive.box('data');
final settings = Hive.box('settings');



/// add prescription form
// final addPrescriptionForm = RM.injectForm(
//   autovalidateMode: AutovalidateMode.always,
//   submit: () async {
//     // await Future.delayed(const Duration(seconds: 1));
//     // print(emailRM.value);
//     // print(passwordRM.value);
//   },
// );

/// text editings ?

// final medicine = RM.injectFormField('');
// final ReactiveModel<List<String>> _medicines = RM.inject(
//   () => data.get('medicines') ?? [],
//   sideEffects: SideEffects(
//     initState: () => print(
//       'MEDICINES_INIT',
//     ),
//     onSetState: (s) {
//       print(s.data?.last);
//     },
//     dispose: () => print('MEDICINE_DISPOSE'),
//   ),
// );
// List<String> get medicines => _medicines.state;
// set medicines(value) => _medicines.state = value;

// final medicineController = RM.injectTextEditing();

// addMedicine(String medicine, context) {
//   if (medicines.contains(medicine)) {
//     print('$medicine already present');
//     ScaffoldMessenger.of(context)
//       ..hideCurrentSnackBar()
//       ..showSnackBar(SnackBar(
//         content: Text(
//           'already present.',
//         ),
//         duration: Duration(seconds: 2),
//       ));
//   } else {
//     if (medicine.length < 5 || medicine.isEmpty) {
//       // it is string characters length
//     } else {
//       medicines = [
//         ...medicines,
//         medicine,
//       ];
//       ScaffoldMessenger.of(context)
//         ..hideCurrentSnackBar()
//         ..showSnackBar(SnackBar(duration: Duration(seconds: 2), content: Text('${medicine.toUpperCase()} added.')));
//     }
//   }
//   data.put('medicines', medicines);
// }

// removeMedicine(String medicine, context) {
//   medicines = [
//     for (final mdc in medicines)
//       if (mdc != medicine) mdc
//   ];
//   ScaffoldMessenger.of(context)
//     ..hideCurrentSnackBar()
//     ..showSnackBar(
//       SnackBar(
//         duration: Duration(seconds: 2),
//         content: Text('$medicine removed.'),
//       ),
//     );

// data.put('medicines', medicines);
// }


