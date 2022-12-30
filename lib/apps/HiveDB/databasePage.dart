// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables
import 'package:dashboard/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class DatabasePage extends ReactiveStatelessWidget {
  final ReactiveModel<Box> rxDB;

  const DatabasePage({super.key, required this.rxDB});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(padding),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('CLEAR DATABASE'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(padding),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('OPTIMIZE & COMPACT DATABASE'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(padding),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('CLOSE DATABASE'),
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(padding),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'KEY'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'VALUE'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(padding),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('ADD k-v pair to DATABASE'),
            ),
          ),
          Divider(),
          Card(
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Text('RETURN VALUE BY INDEX'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(padding),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(labelText: 'INDEX'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.change_circle),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(padding),
                      child: Text('value'),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(),
          Card(
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Text('RETURN VALUE BY KEY'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(padding),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(labelText: 'KEY'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.change_circle),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(padding),
                      child: Text('value'),
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(padding),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'LIST ALL DATA',
              ),
            ),
          )
        ],
      ),
    );
  }
}

/// check if specific key is present | return the value /true at the key
/// create a map from box
/// add k-v pair
/// add map k-v pairs
/// add at specific key loacation
/// return a key at specific index
/// edit an existing key's value
/// delete a value


