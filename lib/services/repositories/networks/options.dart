import 'package:hive/hive.dart';
import 'package:med_shield_new_version/services/repositories/management/cacheConsts.dart';

part 'options.g.dart';

@HiveType(typeId: optionsCacheId)
class Options {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  Options({
    this.id,
    this.name,
  });
}
