// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import '../core/apps.dart';
import 'questionScreen.dart';
import 'quizCore.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        actions: [
          const HideAppSelector(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Hello to My Quiz App',
              textScaleFactor: 4,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                RM.navigate.to(QuestionScreen(
                  questions: questions,
                ));
              },
              child: Text(
                'Start The Quiz',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
