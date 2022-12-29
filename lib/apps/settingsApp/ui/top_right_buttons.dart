// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TopRightButtons extends StatelessWidget {
  const TopRightButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.minimize),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.maximize),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.close),
        ),
      ],
    );
  }
}
