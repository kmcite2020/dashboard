// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../core.dart';

class UserExperience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(child: Text('USER EXPERIENCE')),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [BrightnessMode(), ColorSwatches(), FontEditor()],
      ),
    );
  }
}

class BrightnessMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('BRIGHTNESS'),
              IconButton(
                icon: Icon(dark ? Icons.dark_mode : Icons.light_mode),
                onPressed: () => dark = !dark,
              ),
            ],
          ),
        ),
        Column(
          children: [
            InkWell(
              radius: 100,
              highlightColor: colors[Random().nextInt(colors.length)],
              focusColor: color,
              splashColor: color,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              onTap: () => dark = !dark,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('change your brightness preferences.', softWrap: true),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ColorSwatches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('COLOR SWATCHES'),
              IconButton(
                icon: Icon(Icons.color_lens),
                onPressed: () {
                  color = colors[Random().nextInt(colors.length)];
                  dark = Random().nextBool();
                },
              ),
            ],
          ),
        ),
        Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('personalize your app with colors'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Wrap(
                  //   shrinkWrap: true,
                  children: [
                    for (final i in colors)
                      InkWell(
                        radius: 100,
                        highlightColor: color,
                        focusColor: color,
                        splashColor: color,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        onTap: () {
                          color = i;
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: i,
                            shape: BoxShape.rectangle,
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          width: size.width / 6,
                          height: size.height / 14,
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: InkWell(
                        radius: 100,
                        highlightColor: color,
                        focusColor: color,
                        splashColor: color,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.rectangle,
                            border: Border.all(color: colors[Random().nextInt(colors.length)], width: 4),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          width: size.width / 3,
                          height: size.height / 14,
                          child: Icon(Icons.color_lens_outlined),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FontEditor extends ReactiveStatelessWidget {
  final isShown = false.inj(autoDisposeWhenNotUsed: false);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('FONTS - $font'),
              IconButton(
                  onPressed: () {
                    isShown.toggle();
                  },
                  icon: Icon(isShown.state ? Icons.arrow_upward : Icons.arrow_downward))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('change your fonts'),
        ),
        isShown.state
            ? Wrap(
                children: [
                  for (final String eachFont in fonts)
                    InkWell(
                      highlightColor: color,
                      focusColor: color,
                      splashColor: color,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      onTap: () {
                        fontRM.state = eachFont;
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(eachFont),
                      ),
                    ),
                ],
              )
            : SizedBox(),
      ],
    );
  }
}
