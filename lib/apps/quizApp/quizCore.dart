// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore_for_file: file_names
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:uuid/uuid.dart';

final questionsRM = RM.inject<List<Question>>(
  () => [
    Question(
      id: Uuid().v1(),
      question: 'What is hell',
      options: [
        'A  ',
        'S',
        'SD',
      ],
      answerIndex: 1,
      explaination: 'null',
    ),
  ],
);
// List<Question> get questions => questionsRM.state;
// set questions(value) => questionsRM.state = value;

// addQuestion() {
//   questions = [
//     ...questions,
//     Question(
//       id: Uuid().v1(),
//       question: 'What is hell',
//       options: [
//         Option(option: 'love', index: 0),
//         Option(option: 'hate', index: 1),
//         Option(option: 'death', index: 2),
//       ],
//       correctOptionIndex: 1,
//     ),
//   ];
// }

class Question extends Equatable {
  final String id;
  final String question;
  final List<String> options;
  final int answerIndex;
  final String explaination;
  const Question({
    required this.id,
    required this.question,
    required this.options,
    required this.answerIndex,
    required this.explaination,
  });

  Question copyWith({
    String? id,
    String? question,
    List<String>? options,
    int? answerIndex,
    String? explaination,
  }) {
    return Question(
      id: id ?? this.id,
      question: question ?? this.question,
      options: options ?? this.options,
      answerIndex: answerIndex ?? this.answerIndex,
      explaination: explaination ?? this.explaination,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question': question,
      'options': options,
      'answerIndex': answerIndex,
      'explaination': explaination,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] as String,
      question: map['question'] as String,
      options: List<String>.from((map['options'] as List<String>)),
      answerIndex: map['answerIndex'] as int,
      explaination: map['explaination'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) => Question.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      question,
      options,
      answerIndex,
      explaination,
    ];
  }
}
