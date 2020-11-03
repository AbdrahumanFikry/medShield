import 'package:hive/hive.dart';
import 'package:med_shield_new_version/services/repositories/management/cacheConsts.dart';

part 'favourite.g.dart';

@HiveType(typeId: favouriteCacheId)
class Favourite {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String description;

  @HiveField(3)
  String area;

  @HiveField(4)
  String governorate;

  @HiveField(5)
  String address;

  @HiveField(6)
  double latitude;

  @HiveField(7)
  double longitude;

  @HiveField(8)
  String mobile;

  @HiveField(9)
  String phone_1;

  @HiveField(10)
  String phone_2;

  @HiveField(11)
  String phone_3;

  @HiveField(12)
  int pageID;

  @HiveField(13)
  String specialization;

  Favourite({
    this.id,
    this.specialization,
    this.description,
    this.name,
    this.phone_1,
    this.phone_2,
    this.phone_3,
    this.governorate,
    this.area,
    this.longitude,
    this.latitude,
    this.mobile,
    this.address,
    this.pageID,
  });
}
