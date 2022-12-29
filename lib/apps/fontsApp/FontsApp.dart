// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_returning_null_for_void

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class Store implements IPersistStore {
  late Box box;

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox('STATES_REBUILDER');
  }

  @override
  String? read(String key) {
    return box.get(key);
  }

  @override
  Future<void> write<T>(String key, T value) async {
    await box.put(key, value);
  }

  @override
  Future<void> delete(String key) async {
    await box.delete(key);
  }

  @override
  Future<void> deleteAll() async {
    await box.clear();
  }
}

class FontsApp extends ReactiveStatelessWidget {
  const FontsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return TopAppWidget(
      ensureInitialization: () => [
        Future.delayed(
          Duration(
            seconds: 1,
          ),
        ),
      ],
      onWaiting: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              backgroundColor: color,
              body: Center(
                  child: Icon(
                Icons.font_download,
                size: 250,
              )))),
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: color, fontFamily: GoogleFonts.getFont(font).fontFamily, brightness: dark ? Brightness.dark : Brightness.light),
        home: MyHomePage(),
      ),
    );
  }
}

final List<String> fonts = GoogleFonts.asMap().keys.toList();
String get font => fontRM.state;
final fontRM = RM.inject<String>(
  () => fonts.first,
  persist: () => PersistState(
    key: 'FONT',
  ),
);
bool get dark => darkRM.state;
final darkRM = RM.inject<bool>(
  () => false,
  persist: () => PersistState(key: 'DARK'),
);
MaterialColor get color => colorRM.state;
final colorRM = RM.inject<MaterialColor>(
  () => Colors.primaries.first,
  persist: () => PersistState(
    debugPrintOperations: true,
    key: 'COLOR_INDEX',
    toJson: (s) => Colors.primaries.indexOf(s).toString(),
    fromJson: (json) => Colors.primaries[int.parse(json)],
  ),
);

@immutable
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => darkRM.toggle(),
            icon: Icon(
              !dark ? Icons.light_mode : Icons.dark_mode,
              color: dark ? Colors.black54 : Colors.yellow,
            ),
          ),
        ],
        elevation: 0,
        toolbarHeight: 80,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Google Fonts',
                textScaleFactor: 1.2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'TINKER WITH FONTS',
                softWrap: true,
                textScaleFactor: .5,
              ),
            ),
          ],
        ),
      ),
      body: Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'ABCDEDFGHIJKLMNOPQRSTUVWXYZ',
                  textScaleFactor: .7,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'abcdefghijklmnopqrstuvwxyz',
                  softWrap: true,
                  textScaleFactor: .9,
                ),
              ),
            ],
          ),
          toolbarHeight: 80,
          actions: [
            dark
                ? SizedBox()
                : IconButton(
                    tooltip: 'RANDOMIZE COLOR EXPERIENCE',
                    onPressed: () => colorRM.state = Colors.primaries[Random().nextInt(Colors.primaries.length)],
                    icon: Icon(Icons.color_lens),
                  ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            for (final String eachFont in fonts)
              RadioListTile<String>(
                title: Text(
                  eachFont,
                  style: GoogleFonts.getFont(eachFont),
                ),
                value: eachFont,
                groupValue: font,
                onChanged: (selectedFont) => fontRM.state = selectedFont!,
                secondary: Text((fonts.indexOf(eachFont) + 1).toString()),
              ),
            Text(
              fonts.length.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
