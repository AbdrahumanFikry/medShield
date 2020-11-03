import 'package:med_shield_new_version/services/repositories/management/cacheConsts.dart';
import 'package:med_shield_new_version/services/repositories/management/hive_object_extras.dart';

class SettingsRepo extends ActiveRepo<String, dynamic> {
  @override
  String get boxName => settingsBoxName;

  int get cachedUserId => getValueById('cachedUserId');

  String get cachedLang => getValueById('cachedLang');

  Future setCachedUserId(int value) async =>
      await dataBox.put('cachedUserId', value);

  Future setCachedLang(String value) async =>
      await dataBox.put('cachedLang', value);
}
