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
        Option(option: 'love', index: 0),
        Option(option: 'hate', index: 1),
        Option(option: 'death', index: 2),
      ],
      correctOptionIndex: 1,
    ),
  ],
);
List<Question> get questions => questionsRM.state;
set questions(value) => questionsRM.state = value;

addQuestion() {
  questions = [
    ...questions,
    Question(
      id: Uuid().v1(),
      question: 'What is hell',
      options: [
        Option(option: 'love', index: 0),
        Option(option: 'hate', index: 1),
        Option(option: 'death', index: 2),
      ],
      correctOptionIndex: 1,
    ),
  ];
}

class Question extends Equatable {
  final String id;
  final String question;
  final List<Option> options;
  final int correctOptionIndex;
  const Question({
    required this.id,
    required this.question,
    required this.options,
    required this.correctOptionIndex,
  });

  Question copyWith({
    String? id,
    String? question,
    List<Option>? options,
    int? correctOptionIndex,
  }) {
    return Question(
      id: id ?? this.id,
      question: question ?? this.question,
      options: options ?? this.options,
      correctOptionIndex: correctOptionIndex ?? this.correctOptionIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question': question,
      'options': options.map((x) => x.toMap()).toList(),
      'correctOptionIndex': correctOptionIndex,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] as String,
      question: map['question'] as String,
      options: List<Option>.from(
        (map['options'] as List<int>).map<Option>(
          (x) => Option.fromMap(x as Map<String, dynamic>),
        ),
      ),
      correctOptionIndex: map['correctOptionIndex'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) => Question.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, question, options, correctOptionIndex];
}

class Option extends Equatable {
  final int index;
  final String option;
  const Option({
    required this.index,
    required this.option,
  });

  Option copyWith({
    int? index,
    String? option,
  }) {
    return Option(
      index: index ?? this.index,
      option: option ?? this.option,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'index': index,
      'option': option,
    };
  }

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(
      index: map['index'] as int,
      option: map['option'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Option.fromJson(String source) => Option.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [index, option];
}
