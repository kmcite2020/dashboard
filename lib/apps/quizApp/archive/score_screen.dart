// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                // style: Theme.of(context)
                //     .textTheme
                //     .headline3
                //     .copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "{_qnController.correctAns * 10}/{_qnController.questions.length * 10}",
                // style: Theme.of(context)
                //     .textTheme
                //     .headline4
                //     .copyWith(color: kSecondaryColor),
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
