import 'package:flutter/foundation.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class GuidHiveObject extends HiveObject {
  String get id => key;
}

abstract class IntHiveObject extends HiveObject {
  int get id => key;
}

class BoxConfig {
  final String name;
  final bool isLazy;

  BoxConfig({@required this.name, @required this.isLazy});
}

abstract class MultiBoxRepo {
  List<BoxConfig> get boxConfigs;

  Future<void> init();
}

abstract class Repo<TKey, TVal> extends GetxService {
  String get boxName;

  Future<void> init();
}

abstract class LazyRepo<TKey, TVal> extends Repo<TKey, TVal> {
  LazyBox<TVal> dataBox;

  Future<TVal> getValueById(TKey key) {
    if (key == null) return null;
    return dataBox.get(key);
  }

  Future<void> init() async {
    dataBox = await Hive.openLazyBox(boxName);
  }

  ValueListenable<LazyBox<TVal>> dataListenable([List<TKey> keys]) =>
      dataBox.listenable(keys: keys);

  Future<List<TVal>> getAllValues() async {
    final l = List<TVal>();
    for (var item in dataBox.keys) {
      l.add(await dataBox.get(item));
    }
    return l;
  }

  Future<void> updateBulk(Map<TKey, TVal> silentMap) async {
    await dataBox.putAll(silentMap);
  }
}

abstract class ActiveRepo<TKey, TVal> extends Repo<TKey, TVal> {
  Box<TVal> dataBox;

  TVal getValueById(TKey key) {
    if (key == null) return null;
    return dataBox.get(key);
  }

  Future<void> init() async {
    dataBox = await Hive.openBox<TVal>(boxName);
  }

  ValueListenable<Box<TVal>> dataListenable([List<TKey> keys]) =>
      dataBox.listenable(keys: keys);

  List<TVal> getAllValues() {
    return dataBox.values.toList();
  }

  Future<void> updateBulk(Map<TKey, TVal> silentMap) async {
    await dataBox.putAll(silentMap);
  }
}
