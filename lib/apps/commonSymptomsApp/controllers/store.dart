import 'package:shared_preferences/shared_preferences.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

class StorageRM extends IPersistStore {
  late SharedPreferences prefs;

  @override
  Future<void> init() async {
    // Initialize the plugging
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Object? read(String key) {
    return prefs.getString(key);
  }

  @override
  Future<void> write<T>(String key, T value) async {
    await prefs.setString(key, value as String);
  }

  @override
  Future<void> delete(String key) async {
    await prefs.remove(key);
  }

  @override
  Future<void> deleteAll() async {
    await prefs.clear();
  }
}
