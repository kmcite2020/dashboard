// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unrelated_type_equality_checks, unused_local_variable, empty_statements, unused_import, avoid_print, must_be_immutable, unnecessary_null_comparison, sized_box_for_whitespace, prefer_typing_uninitialized_variables, dead_code,use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unrelated_type_equality_checks, unused_local_variable, empty_statements, unused_import, avoid_print, must_be_immutable, unnecessary_null_comparison, sized_box_for_whitespace, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, unnecessary_overrides, prefer_function_declarations_over_variables, duplicate_ignore, unused_element

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import '../../core/themes.dart';
import 'controllers/core.dart';
import 'controllers/i18n.dart';
import 'veiws/dashboard.dart';
import 'veiws/drawer.dart';
import 'veiws/medicines.dart';
import 'veiws/prescriptions.dart';
import 'veiws/settings.dart';

clearAll() {
  Hive.box('data').clear();
  Hive.box('settings').clear();
  Hive.box('prescriptions').clear();
  Hive.box('medicines').clear();
}

class PrescriptionsApp extends StatelessWidget {
  SettingController settingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        translations: AppTranslations(),
        locale: Get.deviceLocale,
        fallbackLocale: Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          drawerTheme: DrawerThemeData(
            backgroundColor: settingController.dark ? colors[settingController.color][900] : colors[settingController.color][200],
            shape: Border.all(
              color: settingController.dark ? Colors.green : colors.last,
            ),
            elevation: 20,
          ),
          popupMenuTheme: PopupMenuThemeData(color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),
          elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle()),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            focusColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            hoverColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            splashColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            backgroundColor: settingController.dark ? colors[settingController.color][100] : colors[settingController.color][900],
            foregroundColor: settingController.dark ? colors[settingController.color][900] : colors[settingController.color][100],
          ),
          scaffoldBackgroundColor: settingController.dark ? colors[settingController.color][900] : colors[settingController.color][200],
          listTileTheme: ListTileThemeData(
            style: ListTileStyle.list,
            tileColor: settingController.dark ? colors[settingController.color][900] : colors[settingController.color][300],
          ),
          navigationBarTheme: NavigationBarThemeData(
            surfaceTintColor:
                settingController.dark ? Colors.primaries[settingController.color][900] : Colors.primaries[settingController.color][100],
            indicatorColor: settingController.dark ? colors[settingController.color][900] : colors[settingController.color][400],
            height: 65,
            backgroundColor: settingController.dark ? colors[settingController.color][400] : colors[settingController.color][900],
          ),
          appBarTheme: AppBarTheme(
            centerTitle: true,
            color: settingController.dark ? colors[settingController.color][800] : colors[settingController.color][600],
          ),
          useMaterial3: settingController.material, // faulty
          primarySwatch: colors[settingController.color],
          brightness: settingController.dark ? Brightness.dark : Brightness.light,
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(),
            margin: EdgeInsets.all(0),
            color: settingController.dark ? colors[settingController.color][900] : colors[settingController.color][500],
          ),
          textTheme: TextTheme(
            labelLarge: GoogleFonts.getFont(fonts[settingController.font]),
            labelMedium: GoogleFonts.getFont(fonts[settingController.font]),
            labelSmall: GoogleFonts.getFont(fonts[settingController.font]),
            titleMedium: GoogleFonts.getFont(fonts[settingController.font]),
            titleSmall: GoogleFonts.getFont(fonts[settingController.font]),
            bodyLarge: GoogleFonts.getFont(fonts[settingController.font]),
            bodyMedium: GoogleFonts.getFont(fonts[settingController.font]),
            bodySmall: GoogleFonts.getFont(fonts[settingController.font]),
            displayLarge: GoogleFonts.getFont(fonts[settingController.font]),
            displayMedium: GoogleFonts.getFont(fonts[settingController.font]),
            displaySmall: GoogleFonts.getFont(fonts[settingController.font]),
            headlineLarge: GoogleFonts.getFont(fonts[settingController.font]),
            headlineMedium: GoogleFonts.getFont(fonts[settingController.font]),
            headlineSmall: GoogleFonts.getFont(fonts[settingController.font]),
            titleLarge: GoogleFonts.getFont(fonts[settingController.font]),
          ),
        ),
        home: Prescriptions(),
      ),
    );
  }
}

/// OMEC 40MG IV STAT
/// LANSPRO
/// HYDRALAZINE
/// constructor will not return a value
/// can receive parameters
/// is a function
///
