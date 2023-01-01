// ignore_for_file: file_names, prefer_const_constructors, unused_import, unnecessary_import, implementation_imports, prefer_const_literals_to_create_immutables, unused_local_variable
import 'package:dashboard/apps/quizApp/quizCore.dart';
import 'package:dashboard/apps/quizManagerApp/addSectionForm.dart';
import 'package:dashboard/core/reactiveModels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../core/storage/hiveStorage.dart';

final addQuestionForm = RM.injectForm(
  autovalidateMode: AutovalidateMode.always,
  submit: () async {
    addQuestionToSection(
        Question(
          id: randomID,
          question: q.value,
          options: [
            a.value,
            b.value,
            c.value,
            d.value,
          ],
          answerIndex: answer.value,
          explaination: 'null',
        ),
        currentSectionF.value);
  },
);

final q = RM.injectTextEditing();
final a = RM.injectTextEditing();
final b = RM.injectTextEditing();
final c = RM.injectTextEditing();
final d = RM.injectTextEditing();
final answer = RM.injectFormField<int>(0);
final currentSectionF = RM.injectFormField<Section>(section);
Section get section => sections.first;
final sectionsRM = RM.inject<List<Section>>(() => <Section>[], autoDisposeWhenNotUsed: false);
List<Section> get sections => sectionsRM.state;
set sections(List<Section> val) => sectionsRM.state = val;
bool get isWaiting => sectionsRM.isWaiting;
set addSection(Section section) => sections = [...sections, section];
void addQuestionToSection(Question question, Section section) {
  print(sections);
  sections = [
    for (final sect in sections)
      if (sect == section)
        sect.copyWith(
          questions: [
            ...sect.questions,
            question,
          ],
        )
  ];
  print(sections);
  // currentSectionF.value = sections.first;
  // for (final eachSection in sections) {
  //   if (eachSection == currentSectionF.value) {
  //     eachSection.copyWith(questions: [...eachSection.questions, question]);
  //   }
  // }
}

class AddQuestionForm extends ReactiveStatelessWidget {
  const AddQuestionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          DropdownButtonFormField(
            value: currentSectionF.value,
            items: sections
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e.toString(),
                    ),
                  ),
                )
                .toList(),
            onChanged: currentSectionF.onChanged,
          ),
          Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Question'),
                controller: q.controller,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'A',
                ),
                controller: a.controller,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'B',
                ),
                controller: b.controller,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'C',
                ),
                controller: c.controller,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'D',
                ),
                controller: d.controller,
              ),
              OnFormFieldBuilder(
                listenTo: answer,
                builder: (_, __) => DropdownButtonFormField<int>(
                  items: List.generate(
                    4,
                    (index) => DropdownMenuItem(
                      value: index,
                      child: Text(
                        index.toString(),
                      ),
                    ),
                  ),
                  onChanged: __,
                ),
              ),
              ElevatedButton(
                onPressed: addQuestionForm.isValid ? addQuestionForm.submit : null,
                child: Text(
                  'Add Question',
                ),
              ),
              for (final q in currentSectionF.value.questions) Text(q.toString())
            ],
          )
        ],
      ),
    );
  }
}
