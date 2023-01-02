// ignore_for_file: file_names, prefer_const_constructors, unused_import, unnecessary_import, implementation_imports, prefer_const_literals_to_create_immutables, unused_local_variable
import 'package:dashboard/apps/quizApp/quizCore.dart';
import 'package:dashboard/apps/quizManagerApp/app.dart';
import 'package:dashboard/core/reactiveModels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../core/storage/hiveStorage.dart';
import 'reactiveModels.dart';

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
