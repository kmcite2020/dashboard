// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../core/core.dart';
import 'widgets.dart';

class PatientsProgressBar extends ReactiveStatelessWidget {
  PatientsProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            LinearProgressIndicator(
              minHeight: 40,
              // value: admittedPatients.keys.length / admissionsCapacity.value,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 5),
                // Text3(
                //   '${(admittedPatients.length / admissionsCapacity.value * 100).toInt()}% ',
                //   size: 20,
                // ),
                // Text3(
                //   admittedPatients.isEmpty
                //       ? 'Ward is empty '
                //       : (admittedPatients.length >=
                //               admissionsCapacity.value.toInt())
                //           ? 'Ward is full'
                //           : 'Patients',
                //   size: 20,
                // ),
                // Text3(
                //   '${admittedPatients.length}/${admissionsCapacity.value.toInt()}',
                //   size: 20,
                // ),
                SizedBox(width: 5),
              ],
            )
          ],
        ),
      ),
    );
  }
}
