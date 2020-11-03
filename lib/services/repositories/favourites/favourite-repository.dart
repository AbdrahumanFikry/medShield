import 'package:med_shield_new_version/services/repositories/favourites/favourite.dart';
import 'package:med_shield_new_version/services/repositories/management/cacheConsts.dart';
import 'package:med_shield_new_version/services/repositories/management/hive_object_extras.dart';

class FavRepo extends ActiveRepo<int, Favourite> {
  @override
  String get boxName => favBoxName;

  Future<List<Favourite>> getAllFavourites() async {
    List<Favourite> allCachedFavourites = getAllValues() ?? [];
    return allCachedFavourites;
  }

  Future<Favourite> addToFavourites(Favourite favourite) async {
    var local = dataBox.get(favourite.id, defaultValue: Favourite());
    local.id = favourite.id;
    local.pageID = favourite.pageID;
    local.name = favourite.name;
    local.address = favourite.address;
    local.mobile = favourite.mobile;
    local.latitude = favourite.latitude;
    local.longitude = favourite.longitude;
    local.area = favourite.area;
    local.governorate = favourite.governorate;
    local.phone_1 = favourite.phone_1;
    local.phone_2 = favourite.phone_2;
    local.phone_3 = favourite.phone_3;
    local.specialization = favourite.specialization;
    local.description = favourite.description;
    await dataBox.put(favourite.id, local);
    return local;
  }

  Future<bool> removeFromFavourites(Favourite favourite) async {
    await dataBox.delete(favourite.id);
    return true;
  }
}
