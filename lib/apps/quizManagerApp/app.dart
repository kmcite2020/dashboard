// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:dashboard/apps/quizManagerApp/add_section_form.dart';
import 'package:dashboard/core/apps.dart';
import 'package:dashboard/core/reactiveModels.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'reactiveModels.dart';

class QuizManagerApp extends ReactiveStatelessWidget {
  const QuizManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: OnFormBuilder(
          listenTo: addSectionForm,
          builder: () => TextField(
            controller: sectionF.controller,
            decoration: InputDecoration(errorText: sectionF.error),
            onSubmitted: (value) {},
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(padding),
            child: IconButton(
                onPressed: () => addSectionForm.submit(),
                icon: Icon(Icons.add)),
          ),
          AppSelectorToggle(),
        ],
      ),
      body: sections.isEmpty
          ? Center(child: Text('No section present.'))
          : ListView(
              children: [
                for (final section in sections)
                  Text('section.name ${section.questions.length}'),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RM.navigate.to(AddSectionForm());
        },
      ),
    );
  }
}
