import 'package:hive/hive.dart';
import 'package:med_shield_new_version/services/repositories/management/cacheConsts.dart';

part 'user.g.dart';

@HiveType(typeId: userCacheId)
class User {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String email;

  @HiveField(3)
  String image;

  @HiveField(4)
  String phone;

  @HiveField(5)
  String company_name;

  @HiveField(6)
  String gender;

  @HiveField(7)
  String date_of_birth;

  @HiveField(8)
  String insurance_type;

  @HiveField(9)
  String medication;

  @HiveField(10)
  String start_date;

  @HiveField(11)
  String end_date;

  @HiveField(12)
  String medicalId;

  @HiveField(13)
  int customer_number;
}
