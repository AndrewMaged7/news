import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@singleton
class HiveCacheHelper {
  static String _boxName = 'appCache';
  static Box? _box;

  static Box get _cacheBox {
    final box = _box;
    if (box != null) {
      return box;
    }

    if (Hive.isBoxOpen(_boxName)) {
      return _box = Hive.box(_boxName);
    }

    throw StateError(
      'HiveCacheHelper.init() must be awaited before using the cache.',
    );
  }

  static Future<void> init(String boxName) async {
     await Hive.initFlutter();
    _boxName = boxName;

    if (Hive.isBoxOpen(boxName)) {
      _box = Hive.box(boxName);
      return;
    }

    _box = await Hive.openBox(boxName);
  }

  static Future<void> saveData<T>(
    String key,
    T value,
  ) async {
    await _cacheBox.put(key, value);
  }

  static T? getData<T>(String key) {
    return _cacheBox.get(key) as T?;
  }

  static List<T> getListData<T>(String key) {
    final box = _cacheBox;
    final value = box.get(key);

    if (value == null) {
      return <T>[];
    }

    if (value is List<T>) {
      return List<T>.from(value);
    }

    if (value is List) {
      try {
        return value.cast<T>();
      } catch (_) {
        return <T>[];
      }
    }

    if (value is T) {
      final migrated = <T>[value];
      box.put(key, migrated);
      return migrated;
    }

    return <T>[];
  }

  static Future<void> removeData(String key) async {
    await _cacheBox.delete(key);
  }

  static Future<void> clearData() async {
    await _cacheBox.clear();
  }

  static bool containsKey(String key) {
    return _cacheBox.containsKey(key);
  }
}