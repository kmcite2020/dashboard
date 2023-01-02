// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../quizApp/quizCore.dart';

// void add(Item item) {
//     _selectedItems.state = [..._selectedItems.state, item.id];
//   }

//   void remove(Item item) {
//     _selectedItems.state =
//         _selectedItems.state.where((e) => e != item.id).toList();
//   }

final addQuestionForm = RM.injectForm(
  autovalidateMode: AutovalidateMode.always,
  submit: () async {
    // addQuestionToSection(
    //     Question(
    //       id: randomID,
    //       question: q.value,
    //       options: [
    //         a.value,
    //         b.value,
    //         c.value,
    //         d.value,
    //       ],
    //       answerIndex: answer.value,
    //       explaination: 'null',
    //     ),
    //     currentSectionF.value);
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
set sections(List<Section> value) => sectionsRM.state = value;
bool get isWaiting => sectionsRM.isWaiting;
// void addQuestionToSection(Question question, Section section) {
//   print(sections);
//   sections = [
//     for (final sect in sections)
//       if (sect == section)
//         sect.copyWith(
//           questions: [
//             ...sect.questions,
//             question,
//           ],
//         )
//   ];
//   print(sections);
// }

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
    sectionsRM.state = [
      ...sections,
      Section(
        name: sectionF.value,
        questions: [],
      )
    ];
  },
);

class Section extends Equatable {
  final String name;
  final List<Question> questions;
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
