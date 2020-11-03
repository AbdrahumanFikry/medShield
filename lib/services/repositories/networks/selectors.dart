import 'package:hive/hive.dart';
import 'package:med_shield_new_version/services/repositories/management/cacheConsts.dart';
import 'package:med_shield_new_version/services/repositories/networks/options.dart';

part 'selectors.g.dart';

@HiveType(typeId: selectorCacheId)
class Selectors {
  @HiveField(0)
  List<Options> area;

  @HiveField(1)
  List<Options> governorate;

  @HiveField(2)
  List<Options> specialization;

  @HiveField(3)
  List<Options> service_provider_type;

  @HiveField(4)
  int id;
}
