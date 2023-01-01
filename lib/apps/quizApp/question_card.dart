// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, unused_import
import 'package:dashboard/core/reactiveModels.dart';
import 'package:flutter/material.dart';
import 'option.dart';
import 'question_controller.dart';
import 'quizCore.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: padding),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            // style: Theme.of(context)
            // .textTheme
            // .headline6
            // .copyWith(color: kBlackColor),
          ),
          SizedBox(height: padding / 2),
          ...List.generate(
            question.options.length,
            (index) => Option(
              index: index,
              text: question.options[index],
              press: () => checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
