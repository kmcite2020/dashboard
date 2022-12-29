// ignore_for_file: prefer_const_constructors, unused_import, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';
import 'package:uuid/uuid.dart';

import '../components/custom_drawer.dart';
import '../components/widgets.dart';
import '../core/core.dart';
import 'archives_list.dart';
import 'patient_admission_form.dart';
import 'patients_list.dart';

class Homepage extends StatelessWidget {
  const Homepage();
  static const icon = Icon(Icons.home);
  static const label = 'Homepage';
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text3(label),
        centerTitle: true,
      ),
      drawer: CustomDrawer(label),
      body: ListView(children: [
        for (final patient in patients.state.values)
          Column(
            children: [
              Text(patient.id),
              Text(patient.name),
              Text(patient.disease),
              Text(patient.pulse.toString()),
            ],
          ),
      ]),
      floatingActionButton: ButtonBar(
        children: [
          if (patientList.length < admissionsCapacity.value)
            FloatingActionButton.extended(
              heroTag: Uuid().v1(),
              icon: Icon(MdiIcons.application),
              label: Text3('Request Admission'),
              onPressed: () => RM.navigate.to(PatientAdmissionForm()),
            ),
        ],
      ),
    );
  }
}
