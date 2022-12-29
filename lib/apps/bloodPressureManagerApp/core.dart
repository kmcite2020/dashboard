// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

const colors = Colors.primaries;

final darkRM = RM.inject<bool>(
  () => false,
  persist: () => PersistState(
    key: "__DARK__",
  ),
);
bool get dark => darkRM.state;
set darkUpdate(bool value) => darkRM.state = value;

final colorRM = RM.inject<MaterialColor>(
  () => colors.first,
  persist: () => PersistState(
    key: "__MATERIAL_COLOR__",
    toJson: (s) => jsonEncode(colors.indexOf(s)),
    fromJson: (json) => colors[jsonDecode(json) as int],
  ),
);
MaterialColor get color => colorRM.state;
set colorUpdate(MaterialColor value) => colorRM.state = value;
