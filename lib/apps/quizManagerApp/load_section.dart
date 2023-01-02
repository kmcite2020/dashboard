// ignore_for_file: prefer_const_constructors

import 'package:dashboard/apps/quizApp/quizCore.dart';
import 'package:dashboard/apps/quizManagerApp/reactiveModels.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class LoadSectionWidget extends ReactiveStatelessWidget {
  const LoadSectionWidget({required this.reactiveModel, super.key});
  final ReactiveModel reactiveModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final Section question = sections[index];
        return ListTile(
          title: Text(
            question.name,
          ),
        );
      },
    );
  }
}
