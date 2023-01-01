// ignore_for_file: public_member_api_docs, sort_constructors_first, use_key_in_widget_constructors, must_be_immutable, unused_import
// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:async';

import 'package:dashboard/apps/timerApp/timerApp.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'Questions.dart';
import 'quizCore.dart';

class QuestionScreen extends ReactiveStatelessWidget {
  QuestionScreen({
    required this.questions,
  });
  final List<Question> questions;
  final index = 0.inj();

  late Timer timer;
  final timeRM = RM.inject(() => 0);
  set time(int _) => timeRM.state = _;
  int get time => timeRM.state;
  int maxTime = 1;
  @override
  void didMountWidget(BuildContext context) {
    super.didMountWidget(context);
    time = 15;
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(
      1.seconds,
      (timer) {
        if (time < 1) {
          timer.cancel();
          index.state++;
        } else {
          time--;
        }
      },
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              if (index.state <= 0) {
                index.state = 3;
              } else {
                index.state--;
              }
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Column(
          children: [
            Text('Question'),
            Text('${index.state + 1}'),
          ],
        ),
        centerTitle: true,
        actions: [
          BackButton(),
          IconButton(
              onPressed: () {
                if (index.state >= questions.length - 1) {
                  index.state = 0;
                } else {
                  index.state++;
                }
              },
              icon: Icon(Icons.arrow_forward_ios)),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: time / 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              questions[index.state].question,
              textScaleFactor: 3,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          for (final String eachOption in questions[index.state].options) Text(eachOption),
        ],
      ),
    );
  }
}
