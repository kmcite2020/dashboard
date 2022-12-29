// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../blood_pressures/model.dart';

class TestUI extends ReactiveStatelessWidget {
  const TestUI({super.key});

  @override
  build(context) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: Text('Add New Entry'),
                  onPressed: () {
                    bloodPressuresRM.state = [
                      ...bloodPressuresRM.state,
                      BloodPressureEntry(
                          systolicBP: 120,
                          diastolicBP: 80,
                          patientID: 'patientID',
                          dateTaken: DateTime.now(),
                          bloodPressureType: BloodPressureType.dangerouslyLow)
                    ];
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: Text('State Persistence'),
                  onPressed: () {
                    bloodPressuresRM.persistState();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: () {
                      bloodPressuresRM.refresh();
                      bloodPressuresRM.deletePersistState();
                    },
                    child: Text('Destroy')),
              )
            ],
          ),
        ),
        body: Column(
          children: bloodPressuresRM.state
              .map(
                (e) => ListTile(
                  title: Text(e.patientID),
                  subtitle: Text('${e.systolicBP}/${e.diastolicBP}'),
                  trailing: DropdownButton<BloodPressureType>(
                    value: e.bloodPressureType,
                    items: BloodPressureType.values
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e.name,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: e.updateBloodPressureType,
                  ),
                ),
              )
              .toList(),
        ),
      );
}
