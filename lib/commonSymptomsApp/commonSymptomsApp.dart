// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'controllers/core.dart';
import 'controllers/patient.dart';

class CommonSymptomsApp extends ReactiveStatelessWidget {
  const CommonSymptomsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Common Symptoms'),
        actions: [
          IconButton(
            onPressed: () {
              // RM.navigate.to(Settings());
              // TODO - re build settings app
            },
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.settings,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Divider(),
          Text(
            '${patients.length}',
            textScaleFactor: 3,
          ),
          Divider(),
          Text(mostCommonSymptom.description),
          Divider(),
          for (final eachPatient in patients)
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  "${eachPatient.age.inDays ~/ 365}",
                  textScaleFactor: 1.5,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  int index = patients.indexOf(eachPatient);
                  patients = [...patients]..removeAt(index);
                },
              ),
              title: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(eachPatient.name),
                  ),
                  ElevatedButton.icon(
                    icon: Icon(Icons.update),
                    onPressed: () {
                      updatePatientName('Adn', eachPatient);
                    },
                    label: Text('Update Info'),
                  ),
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Symptoms:"),
                    ),
                    Wrap(
                      children: [
                        for (final Symptom eachSymptom in eachPatient.symptoms)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${eachSymptom.description},"),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet2(context),
      ),
    );
  }
}

void showModalBottomSheet2(context) => showModalBottomSheet(
      context: context,
      builder: (builder) => ListTile(
        title: Text('Patient Admission Form'),
        subtitle: OnFormBuilder(
          listenTo: admissionForm,
          builder: () => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: nameController.controller,
                  focusNode: nameController.focusNode,
                  decoration: InputDecoration(
                    errorText: nameController.error,
                    labelText: 'Full Name',
                    hintText: "Enter patient's name",
                    suffixIcon:
                        nameController.hasError ? const Icon(Icons.error, color: Colors.red) : const Icon(Icons.check, color: Colors.green),
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  enabled: admissionForm.isFormEnabled,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: ageController.controller,
                  focusNode: ageController.focusNode,
                  decoration: InputDecoration(
                    errorText: ageController.error,
                    labelText: 'Age (in years)',
                    hintText: 'Enter patients age in years',
                    suffixIcon:
                        ageController.hasError ? const Icon(Icons.error, color: Colors.red) : const Icon(Icons.check, color: Colors.green),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  maxLength: 3,
                  enabled: admissionForm.isFormEnabled,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OnFormFieldBuilder<List<Symptom>>(
                  listenTo: symptomsController,
                  inputDecoration: InputDecoration(
                    labelText: 'Select any complaints the patient has',
                    hintText: 'Enter complaints',
                    suffixIcon: symptomsController.hasError
                        ? const Icon(Icons.error, color: Colors.red)
                        : const Icon(Icons.check, color: Colors.green),
                  ),
                  builder: (val, onChanged) {
                    return Wrap(
                      children: Symptom.values
                          .map(
                            (e) => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: val.contains(e),
                                  onChanged: (checked) {
                                    if (checked!) {
                                      symptomsController.value = [...val, e];
                                    } else {
                                      symptomsController.value = val.where((el) => e != el).toList();
                                    }
                                  },
                                ),
                                Text(e.description),
                                const SizedBox(width: 8),
                              ],
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: admissionForm.isDirty
                            ? () {
                                admissionForm.reset();
                              }
                            : null,
                        child: const Text('Reset Form')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      onPressed: admissionForm.isValid
                          ? () async {
                              admissionForm.submit();
                              RM.navigate.back();
                            }
                          : null,
                      icon: Icon(Icons.check),
                      label: const Text(
                        'Request Admission',
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
