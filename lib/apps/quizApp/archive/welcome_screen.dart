// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:dashboard/core/reactiveModels.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../quiz_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(flex: 2), //2/6
              Text(
                "Let's Play Quiz,",
                style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text("Enter your informations below"),
              Spacer(), // 1/6
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFF1C2341),
                  hintText: "Full Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
              ),
              Spacer(), // 1/6
              InkWell(
                onTap: () => RM.navigate.to(QuizScreen()),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  // padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                  // decoration: BoxDecoration(
                  //   gradient: kPrimaryGradient,
                  //   borderRadius: BorderRadius.all(Radius.circular(12)),
                  // ),
                  child: Text(
                    "Lets Start Quiz",
                    style: Theme.of(context).textTheme.button!.copyWith(color: Colors.black),
                  ),
                ),
              ),
              Spacer(flex: 2), // it will take 2/6 spaces
            ],
          ),
        ),
      ),
    );
  }
}
