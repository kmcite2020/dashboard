// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'app.dart';
import 'persistence.dart';

final userID = RM.inject<String?>(() => null);
IPersistStore get store => HiveStore(userID.state ?? 'guest');
