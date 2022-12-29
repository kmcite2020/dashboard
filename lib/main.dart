// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, avoid_print, unused_local_variable, unused_import, non_constant_identifier_names, use_function_type_syntax_for_parameters, prefer_const_constructors_in_immutables, unused_element, must_be_immutable, prefer_typing_uninitialized_variables, constant_identifier_names, body_might_complete_normally_nullable, annotate_overrides, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'core/apps.dart';
import 'core/storage.dart';
import 'core/themes.dart';
import 'idealApp/controllers/core.dart';
import 'idealApp/ui/dashboard.dart';
import 'idealApp/ui/products/add_product.dart';
import 'idealApp/ui/products/products.dart';
import 'idealApp/ui/settings.dart';
import 'core/utils.dart';

void main() async {
  await Hive.initFlutter();
  // TODO re-implement database name as there is dependency on internal app
  await Hive.openBox(database);
  GoogleFonts.config.allowRuntimeFetching = true;
  // paddingRM.deletePersistState;
  runApp(MyApp());
}

class MyApp extends TopStatelessWidget {
  @override
  List<FutureOr<void>>? ensureInitialization() => [
        Future.delayed(1.seconds),
        initDefaultImage,
        RM.storageInitializer(HiveStore()),
      ];
  @override
  Widget? splashScreen() => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: color[200],
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.store,
                  size: 250,
                  color: Colors.purple,
                ),
                Text(
                  'URideal Store',
                  textScaleFactor: 3,
                ),
              ],
            ),
          ),
        ),
      );
  @override
  Widget errorScreen(error, void Function() refresh) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '💔',
              textScaleFactor: 15,
            ),
            Text(
              'Error',
              textScaleFactor: 8,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(context) => OnReactive(
        () => MaterialApp(
          navigatorKey: RM.navigate.navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: theme,
          themeMode: themeMode,
          darkTheme: darkTheme,
          home: Scaffold(
            appBar: hide.state
                ? null
                : AppBar(
                    title: DropdownButtonFormField(
                      value: app.state,
                      items: Apps.values
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e.toString(),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (onChanged) {
                        app.state = onChanged!;
                        hide.toggle();
                      },
                    ),
                  ),
            body: runSelectedApp,
          ),
        ),
      );
}
