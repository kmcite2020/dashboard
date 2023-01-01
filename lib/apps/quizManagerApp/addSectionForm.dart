// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'package:dashboard/apps/quizApp/quizCore.dart';
import 'package:dashboard/apps/quizManagerApp/addQuestionForm.dart';

import '../../core/apps.dart';

// void add(Item item) {
//     _selectedItems.state = [..._selectedItems.state, item.id];
//   }

//   void remove(Item item) {
//     _selectedItems.state =
//         _selectedItems.state.where((e) => e != item.id).toList();
//   }

final sectionF = RM.injectTextEditing(
  validators: [
    (text) {
      for (final eachSection in sections) {
        if (text == eachSection.name) {
          return 'section already exists';
        }
      }
      return null;
    }
  ],
);

final addSectionForm = RM.injectForm(
  autovalidateMode: AutovalidateMode.always,
  submit: () async {
    addSection = Section(
      name: sectionF.value,
      questions: [],
    );
  },
);

class QuizManagerApp extends ReactiveStatelessWidget {
  const QuizManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz Management',
        ),
        actions: [
          const AppSelectorToggle(),
        ],
      ),
      body: Column(
        children: [
          OnFormBuilder(
            listenTo: addSectionForm,
            builder: () => Row(
              children: [
                Expanded(
                  flex: 4,
                  child: TextField(
                    controller: sectionF.controller,
                    decoration: InputDecoration(errorText: sectionF.error),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: addSectionForm.isValid ? addSectionForm.submit : null,
                    child: Text(
                      'ADD',
                    ),
                  ),
                ),
              ],
            ),
          ),
          for (final section in sections)
            Column(
              children: [
                Text(section.name.toString()),
                for (final question in section.questions)
                  Text(
                    question.toString(),
                  ),
              ],
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RM.navigate.to(
            AddQuestionForm(),
          );
        },
      ),
    );
  }
}

class Section extends Equatable {
  final String name;
  final List<Question> questions;
  int get numberOfQuestion => questions.length;
  const Section({
    required this.name,
    required this.questions,
  });

  Section copyWith({
    String? name,
    List<Question>? questions,
  }) {
    return Section(
      name: name ?? this.name,
      questions: questions ?? this.questions,
    );
  }

  static List<Section> fromListJson(String source) {
    final List result = json.decode(source) as List;
    return result.map((e) => Section.fromJson(e)).toList();
  }

  static String toListJson(List<Section> users) {
    final List result = users.map((e) => e.toJson()).toList();
    return json.encode(result);
  }

  addQuestion(Question question) {
    copyWith(questions: [...questions, question]);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'questions': questions.map((x) => x.toMap()).toList(),
    };
  }

  factory Section.fromMap(Map<String, dynamic> map) {
    return Section(
      name: map['name'] as String,
      questions: List<Question>.from(
        (map['questions'] as List<int>).map<Question>(
          (x) => Question.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Section.fromJson(String source) => Section.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [name, questions];
}
