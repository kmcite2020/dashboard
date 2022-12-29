// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../core/apps.dart';

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
          const HideAppSelector(),
        ],
      ),
      body: Column(
        children: [
          Text(
            'QUIZEZ',
          ),
        ],
      ),
    );
  }
}
