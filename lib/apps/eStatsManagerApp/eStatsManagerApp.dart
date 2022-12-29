// ignore_for_file: prefer_const_constructors, await_only_futures, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

class EStatesManagerApp extends ReactiveStatelessWidget {
  const EStatesManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'You have pushed the button this many times:',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ButtonBar(
        children: [
          for (final x in ThemeMode.values)
            ElevatedButton(
              onPressed: () {},
              child: Text(
                x.name,
              ),
            ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
