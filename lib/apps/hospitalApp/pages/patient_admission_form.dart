//ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables,public_member_api_docs, sort_constructors_first, prefer_typing_uninitialized_variables, must_be_immutable, curly_braces_in_flow_control_structures, unused_import

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:uuid/uuid.dart';

import '../components/investigations.dart';
import '../components/widgets.dart';
import '../core/core.dart';

class PatientAdmissionForm extends ReactiveStatelessWidget {
  static const icon = Icon(Icons.info);
  static const label = 'Patient Admission Form';
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(title: Text3('Patient Admission'), centerTitle: true),
      body: ListView(
        children: [
          TextField(
            onChanged: (value) {
              name.state = value;
            },
          ),
          TextField(
            onChanged: (value) {
              disease.state = value;
            },
          ),
          TextField(
            onChanged: (value) {
              pulse.state = int.parse(value);
            },
          ),
          // TextField(
          //   // controller: id.controller,
          //   keyboardType: TextInputType.name,
          //   decoration: InputDecoration(
          //     labelText: 'NAME',
          //     helperText: 'ADD NAME TO THIS FIELD',
          //     hintText: 'NAME HERE...!',
          //     prefixIcon: Icon(Icons.person_add),
          //     border: OutlineInputBorder(),
          //   ),
          // ),
          // InlineSlider(max: 120, min: 0, title: 'AGE', value: ageController.value),
          // DropdownButtonFormField<bool>(
          //   value: genderController.value,
          //   decoration: InputDecoration(
          //     labelText: 'GENDER',
          //     helperText: 'ADD GENDER TO THIS FIELD',
          //     hintText: 'GENDER HERE...!',
          //     border: OutlineInputBorder(),
          //   ),
          //   icon: Icon(Icons.person),
          //   items: ['MALE', 'FEMALE', 'UNDEFINED'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          //   onChanged: (value) => genderController.state = value!,
          // ),
          // TextFormField(
          //   autovalidateMode: AutovalidateMode.onUserInteraction,
          //   validator: (value) {
          //     if (value == null || value.isEmpty)
          //       return 'Required field';
          //     else
          //       return null;
          //   },
          //   // controller: presentingComplaintsController.controller,
          //   keyboardType: TextInputType.multiline,
          //   maxLines: 3,
          //   minLines: 1,
          //   decoration: InputDecoration(
          //       labelText: 'PRESENTING COMPLAINTS',
          //       helperText: 'ADD COMPLAINTS TO THIS FIELD',
          //       hintText: 'COMPLAINTS HERE...!',
          //       prefixIcon: Icon(Icons.healing),
          //       border: OutlineInputBorder()),
          // ),
          // TextFormField(
          //   autovalidateMode: AutovalidateMode.onUserInteraction,
          //   validator: (value) {
          //     if (value == null || value.isEmpty)
          //       return 'Required field';
          //     else
          //       return null;
          //   },
          //   // controller: activeComplaintsController.controller,
          //   keyboardType: TextInputType.multiline,
          //   maxLines: 3,
          //   minLines: 1,
          //   decoration: InputDecoration(
          //       labelText: 'ACTIVE COMPLAINTS',
          //       helperText: 'ADD COMPLAINTS TO THIS FIELD',
          //       hintText: 'COMPLAINTS HERE...!',
          //       prefixIcon: Icon(Icons.healing),
          //       border: OutlineInputBorder()),
          // ),
          // TextFormField(
          //   autovalidateMode: AutovalidateMode.onUserInteraction,
          //   validator: (value) {
          //     if (value == null || value.isEmpty)
          //       return 'Required field';
          //     else
          //       return null;
          //   },
          //   // controller: historyController.controller,
          //   // initialValue: patient.history,
          //   keyboardType: TextInputType.multiline,
          //   maxLines: 4,
          //   minLines: 1,
          //   decoration: InputDecoration(
          //     labelText: 'HISTORY',
          //     helperText: 'ADD HISTORY TO THIS FIELD',
          //     hintText: 'HISTORY HERE...!',
          //     prefixIcon: Icon(Icons.history),
          //     border: OutlineInputBorder(),
          //   ),
          // ),

          // /// end of feature
          // TextFormField(
          //   autovalidateMode: AutovalidateMode.onUserInteraction,
          //   validator: (value) {
          //     if (value == null || value.isEmpty)
          //       return 'Required field';
          //     else
          //       return null;
          //   },
          //   // controller: examinationsController.controller,
          //   keyboardType: TextInputType.multiline,
          //   maxLines: 6,
          //   minLines: 1,
          //   decoration: InputDecoration(
          //       labelText: 'EXAMINATIONS',
          //       helperText: 'ADD EXAMINATIONS TO THIS FIELD',
          //       hintText: 'EXAMINATIONS HERE...!',
          //       prefixIcon: Icon(Icons.note),
          //       border: OutlineInputBorder()),
          // ),

          // // InlineSlider(
          // //   min: 0,
          // //   max: 300,
          // //   value: systolicBP.value,
          // //   title: 'Systolic BP',
          // // ),
          // // InlineSlider(
          // //   min: 0,
          // //   max: 300,
          // //   value: diastolicBP.value,
          // //   title: 'Diastolic BP',
          // // ),
          // // Text('${systolicBP.value}/${diastolicBP.value}'),
          // InlineSlider(
          //   min: 0,
          //   max: 300,
          //   value: pulseController.value,
          //   title: 'Pulse',
          // ),
          // InlineSlider(
          //   min: 90,
          //   max: 120,
          //   value: temperatureController.value,
          //   title: 'Temperature',
          // ),
          // InlineSlider(
          //   min: 0,
          //   max: 100,
          //   value: saturationController.value,
          //   title: 'Saturation',
          // ),

          // Text('Investigations'),

          // Investigations(),

          // TextFormField(
          //   autovalidateMode: AutovalidateMode.onUserInteraction,
          //   validator: (value) {
          //     if (value == null || value.isEmpty)
          //       return 'Required field';
          //     else
          //       return null;
          //   },
          //   // controller: managementController.controller,
          //   keyboardType: TextInputType.multiline,
          //   maxLines: 6,
          //   minLines: 1,
          //   decoration: InputDecoration(
          //       labelText: 'MANAGEMENT',
          //       helperText: 'ADD MANAGEMENT TO THIS FIELD',
          //       hintText: 'MANAGEMENT HERE...!',
          //       prefixIcon: Icon(Icons.note),
          //       border: OutlineInputBorder()),
          // ),
          // // TextFormField(
          // //   autovalidateMode: AutovalidateMode.onUserInteraction,
          // //   validator: (value) {
          // //     if (value == null || value.isEmpty)
          // //       return 'Required field';
          // //     else
          // //       return null;
          // //   },
          // //   // controller: diagnosisController.controller,
          // //   keyboardType: TextInputType.multiline,
          // //   maxLines: 6,
          // //   minLines: 1,
          // //   decoration: InputDecoration(
          // //       labelText: 'DIAGNOSIS',
          // //       helperText: 'ADD DIAGNOSIS TO THIS FIELD',
          //       hintText: 'DIAGNOSIS HERE...!',
          //       prefixIcon: Icon(Icons.note),
          //       border: OutlineInputBorder()),
          // ),
          // // Text2('We will add BP,Pulse,Temp,Sp02 Monitoring etc in upcoming versions')
        ],
      ),
      floatingActionButton: ButtonBar(
        children: [
          //     BackButton2(),
          FloatingActionButton.extended(
            heroTag: 'admit patient',
            label: Text3('Admit'),
            icon: Icon(Icons.done),
            onPressed: () {
              String id = Uuid().v1();
              // admitPatient();
              // log(investigationsMap.toString());
              patients.state = {
                ...patients.state,
                id: Patient(id, name.state, disease.state, pulse.state),
              };
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
