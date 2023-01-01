// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:dashboard/apps/quizApp/question_controller.dart';
import 'package:dashboard/core/reactiveModels.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/scr/development_booster/development_booster.dart';

import 'question_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: LinearProgressIndicator(),
          ),
          SizedBox(height: padding),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Text.rich(
              TextSpan(
                text: "Question {_questionController.questionNumber.value}",
                // style: Theme.of(context).textTheme.headline4.copyWith(color: kSecondaryColor),
                children: [
                  TextSpan(
                    text: "/{_questionController.questions.length}",
                    // style: Theme.of(context).textTheme.headline5.copyWith(color: kSecondaryColor),
                  ),
                ],
              ),
            ),
          ),
          Divider(thickness: 1.5),
          SizedBox(height: padding),
          OnTabPageViewBuilder(
            listenTo: pageController,
            // Block swipe to next qn
            builder: (index) => QuestionCard(
              question: questions[index],
            ),
          ),
        ],
      ),
    );
  }
}
