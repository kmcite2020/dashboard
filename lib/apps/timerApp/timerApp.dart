// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../core/apps.dart';
import '../../core/themes.dart';

class TimerApp extends ReactiveStatelessWidget {
  TimerApp({super.key});

  late Timer timer;
  final timeRM = RM.inject(() => 0);
  set time(int _) => timeRM.state = _;
  int get time => timeRM.state;
  int maxTime = 1;
  void startTimer() {
    timer = Timer.periodic(
      1.seconds,
      (timer) {
        if (time < 1) {
          timer.cancel();
        } else {
          time--;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        HideAppSelector(),
      ]),
      body: Card(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(padding),
              child: LinearProgressIndicator(
                value: time.toDouble() / maxTime.toDouble(),
                minHeight: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(padding),
              child: Text(
                '$time',
                textScaleFactor: 5,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                children: [
                  DropdownButtonFormField(
                    items: List.generate(20, (index) => index * 5)
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e.toString(),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (localTime) {
                      time = localTime!;
                      maxTime = localTime;
                    },
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: ElevatedButton(
                    onPressed: () {
                      startTimer();
                    },
                    child: Text(
                      'Start',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: OutlinedButton(
                    onPressed: () {
                      timer.cancel();
                    },
                    child: Text(
                      'Stop',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: TextButton(
                    onPressed: () {
                      timer.cancel();
                    },
                    child: Text(
                      'Stop',
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}