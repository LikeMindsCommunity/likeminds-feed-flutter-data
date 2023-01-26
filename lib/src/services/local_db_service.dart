import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';

//Abstract local db service
abstract class _LocalDBService {
  Future<void> init();
  dynamic get(String key);
  void put(String key, dynamic value);
  void close();
  void clear();
  void delete(String key);
  List<String> getKeys();
  List<dynamic> getValues();
  Map<String, dynamic> getAll();
}

/// Local database service for storing data locally
class LocalDBService extends _LocalDBService {
  late final Box _box;

  /// Initialize local database
  /// Initializes hive and opens the local box
  @override
  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('likemindsBox');
  }

  /// Clear local database
  /// Clears the local box
  @override
  void clear() async {
    if (_box.isNotEmpty) {
      await _box.clear();
    }
  }

  /// Close local database
  /// Closes the local box
  @override
  void close() async {
    if (_box.isOpen) {
      await _box.close();
    }
  }

  /// Put value in local database
  /// Puts a value in the local box using the [key] as the key
  /// [value] is the dynamic value to be stored
  @override
  void put(String key, dynamic value) {
    _box.put(key, value);
  }

  /// Get value from local database
  /// Gets a value from the local box using the [key] as the key
  @override
  dynamic get(String key) {
    return _box.get(key);
  }

  /// Delete a value from the local database
  /// Deletes a value from the local box using the [key] as the key
  @override
  void delete(String key) {
    if (containsKey(key)) {
      _box.delete(key);
    }
  }

  /// Check if the local database contains a key
  /// Checks if the local box contains a key
  bool containsKey(String key) {
    return _box.containsKey(key);
  }

  /// Get the length of the local database
  /// Gets the length as [int] of the local box
  /// Returns 0 if the local box is empty
  int length() {
    return _box.length;
  }

  /// Get complete local database
  /// Gets all values from the local box
  /// Returns a [Map] of [String] and [dynamic]
  /// [String] is the key and [dynamic] is the value
  /// Returns an empty [Map] if the local box is empty
  @override
  Map<String, dynamic> getAll() {
    final Map<String, dynamic> map = {};
    for (final key in _box.keys) {
      map[key] = _box.get(key);
    }
    return map;
  }

  /// Get keys from local database
  /// Gets all keys from the local box
  /// Returns a [List] of [String]
  /// Returns an empty [List] if the local box is empty
  /// [String] is the key
  @override
  List<String> getKeys() {
    return _box.keys.cast<String>().toList();
  }

  /// Get values from local database
  /// Gets all values from the local box
  /// Returns a [List] of [dynamic]
  /// Returns an empty [List] if the local box is empty
  /// [dynamic] is the value
  @override
  List getValues() {
    return _box.values.toList();
  }
}
