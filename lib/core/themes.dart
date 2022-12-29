// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:colornames/colornames.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final dependers = {
  themeModeRM,
  fontRM,
  colorRM,
  paddingRM,
  borderRadiusRM,
};
List<Widget> themingWidgets(size) {
  return [
    ThemeModeChanger(),
    ColorChanger(size),
    FontChanger(),
    BorderRadiusChanger(),
    PaddingChanger(),
  ];
}

List<MaterialColor> get colors => Colors.primaries;
List<String> get fonts => GoogleFonts.asMap().keys.toList().take(40).toList();
List<ThemeMode> get themeModes => ThemeMode.values;
double get appBarHeight {
  if (padding <= 10) {
    return 60;
  } else if (padding <= 15 && padding > 10) {
    return padding * 6;
  } else {
    return 90;
  }
}

final themeModeRM = RM.inject<ThemeMode>(
  () => ThemeMode.system,
  persist: () => PersistState(
    key: 'THEME-MODE',
    toJson: (s) => jsonEncode(themeModes.indexOf(s)),
    fromJson: (json) => themeModes[jsonDecode(json)],
  ),
);
ThemeMode get themeMode => themeModeRM.state;
set themeMode(value) => themeModeRM.state = value;

final colorRM = RM.inject<MaterialColor>(
  () => Colors.blue,
  persist: () => PersistState(
    key: 'COLOR',
    toJson: (s) => jsonEncode(colors.indexOf(s)),
    fromJson: (json) => colors[jsonDecode(json)],
  ),
);
MaterialColor get color => colorRM.state;
set color(value) => colorRM.state = value;

final fontRM = RM.inject<String>(
  () => fonts.first,
  persist: () => PersistState(
    key: 'FONT',
  ),
);
String get font => fontRM.state;
set font(value) => fontRM.state = value;

final paddingRM = RM.inject<double>(
  () => 10,
  persist: () => PersistState(key: 'PADDING'),
);
double get padding => paddingRM.state;
set padding(value) => paddingRM.state = value;

final borderRadiusRM = RM.inject<double>(
  () => 10,
  persist: () => PersistState(key: "BORDER-RADIUS"),
);
double get borderRadius => borderRadiusRM.state;
set borderRadius(value) => borderRadiusRM.state = value;

final themeRM = RM.inject<ThemeData>(
  () => ThemeData(
    scaffoldBackgroundColor: color.shade200,
    canvasColor: color.shade300,
    focusColor: color.shade700,
    dialogTheme: DialogTheme(backgroundColor: color),
    popupMenuTheme: PopupMenuThemeData(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(backgroundColor: color.shade100, elevation: 10, toolbarHeight: appBarHeight),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 10,
        backgroundColor: color.shade900,
        foregroundColor: color.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: color.shade700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
        ),
        foregroundColor: color.shade900,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: color.shade800,
        foregroundColor: color.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      // contentPadding: EdgeInsets.all(18),
      filled: true,
      fillColor: color.shade200,
      hoverColor: color.shade600,
      focusColor: color.shade900,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    ),
    colorSchemeSeed: color.shade200,
    cardTheme: CardTheme(
      color: color.shade300,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
      margin: EdgeInsets.all(padding),
    ),
    brightness: Brightness.light,
    useMaterial3: true,
    fontFamily: GoogleFonts.getFont(font).fontFamily,
  ),
  dependsOn: DependsOn(dependers),
);
ThemeData get theme => themeRM.state;

final darkThemeRM = RM.inject(
  () => ThemeData(
    scaffoldBackgroundColor: color.shade900,
    canvasColor: color.shade800,
    focusColor: color.shade400,
    dialogTheme: DialogTheme(backgroundColor: color),
    popupMenuTheme: PopupMenuThemeData(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    ),
    appBarTheme: AppBarTheme(backgroundColor: color.shade900, elevation: 10, toolbarHeight: appBarHeight),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 10,
        minimumSize: Size.fromHeight(40),
        backgroundColor: color.shade300,
        foregroundColor: color.shade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        elevation: 10,
        minimumSize: Size.fromHeight(40),
        backgroundColor: color.shade600,
        foregroundColor: color.shade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 10,
        minimumSize: Size.fromHeight(40),
        backgroundColor: color.shade800,
        foregroundColor: color.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: color.shade800,
      hoverColor: color.shade900,
      focusColor: color.shade600,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    ),
    colorSchemeSeed: color,
    cardTheme: CardTheme(
        color: color.shade900,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
        ),
        margin: EdgeInsets.all(padding)),
    brightness: Brightness.dark,
    useMaterial3: true,
    fontFamily: GoogleFonts.getFont(font).fontFamily,
  ),
  dependsOn: DependsOn(dependers),
);
ThemeData get darkTheme => darkThemeRM.state;

class ThemeModeChanger extends ReactiveStatelessWidget {
  const ThemeModeChanger({super.key});

  @override
  Widget build(context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            title: Text(
              'THEME MODE',
              textScaleFactor: 1.5,
            ),
            subtitle: Text('CUSTOMISE YOUR THEME MODE'),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(padding),
          child: DropdownButtonFormField<ThemeMode>(
            borderRadius: BorderRadius.circular(borderRadius),
            value: themeMode,
            onChanged: (value) => themeMode = value,
            items: themeModes
                .map(
                  (ThemeMode eachThemeMode) => DropdownMenuItem(
                    value: eachThemeMode,
                    child: Text(
                      eachThemeMode.name.toUpperCase(),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class ColorChanger extends ReactiveStatelessWidget {
  final Size size;
  const ColorChanger(this.size, {super.key});
  @override
  Widget build(context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            title: Text(
              'BACKGROUND COLORS',
              textScaleFactor: 1.5,
            ),
            subtitle: Text('CUSTOMISE YOUR BACKGROUND COLOR'),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(padding),
          child: DropdownButtonFormField<MaterialColor>(
            icon: SizedBox(),
            borderRadius: BorderRadius.circular(borderRadius),
            value: color,
            onChanged: (value) => color = value,
            selectedItemBuilder: (context) => colors
                .map(
                  (e) => Text(e.colorName.toUpperCase()),
                )
                .toList(),
            items: colors
                .map(
                  (MaterialColor eachColor) => DropdownMenuItem(
                    value: eachColor,
                    child: Container(
                      width: 200,
                      padding: EdgeInsets.all(padding),
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: eachColor,
                        borderRadius: BorderRadius.circular(borderRadius),
                        border: Border.symmetric(),
                      ),
                      child: Text(
                        eachColor.colorName.toUpperCase(),
                        // style: TextStyle(color: eachColor),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class FontChanger extends ReactiveStatelessWidget {
  const FontChanger({super.key});

  @override
  build(context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            title: Text(
              'FONTS SUPPORT',
              textScaleFactor: 1.5,
              softWrap: true,
            ),
            subtitle: Text('CUSTOMISE YOUR FONTS'),
            trailing: Text(
              '${fonts.length}',
              // textScaleFactor: 2,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(padding),
          child: DropdownButtonFormField<String>(
            borderRadius: BorderRadius.circular(borderRadius),
            value: font,
            onChanged: (value) => font = value,
            items: fonts
                .map(
                  (String eachFont) => DropdownMenuItem(
                    value: eachFont,
                    child: Text(
                      eachFont.toUpperCase(),
                      style: GoogleFonts.getFont(eachFont),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class PaddingChanger extends ReactiveStatelessWidget {
  const PaddingChanger({super.key});
  @override
  Widget build(context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            title: Text(
              'PADDING',
              textScaleFactor: 1.5,
              softWrap: true,
            ),
            subtitle: Text('CUSTOMISE PADDING'),
            trailing: Text(
              '${padding.toInt()}',
              // textScaleFactor: 2,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(padding),
          child: Slider(
            label: padding.toInt().toString(),
            min: 0,
            max: 25,
            // divisions: 10,
            value: padding,
            onChanged: (value) => padding = value,
          ),
        ),
      ],
    );
  }
}

class BorderRadiusChanger extends ReactiveStatelessWidget {
  const BorderRadiusChanger({super.key});
  @override
  Widget build(context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            title: Text(
              'ROUNDED CORNERS',
              textScaleFactor: 1.5,
              softWrap: true,
            ),
            subtitle: Text('CUSTOMISE ROUNDED CORNERS'),
            trailing: Text(
              '${borderRadius.toInt()}',
              // textScaleFactor: 2,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(padding),
          child: Slider(
            label: borderRadius.toInt().toString(),
            // divisions: 20,
            min: 0,
            max: 30,
            value: borderRadius,
            onChanged: (value) => borderRadius = value,
          ),
        ),
      ],
    );
  }
}
