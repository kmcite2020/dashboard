// ignore_for_file: public_member_api_docs, sort_constructors_first, use_key_in_widget_constructors, must_be_immutable
// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'quizCore.dart';

class QuestionScreen extends ReactiveStatelessWidget {
  QuestionScreen({
    required this.questions,
  });
  final List<Question> questions;
  int index = 0;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question # 1'),
        actions: [],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              questions[index].question,
              textScaleFactor: 3,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          for (final Option eachOption in questions[index].options) Text(eachOption.option),
        ],
      ),
    );
  }
}
