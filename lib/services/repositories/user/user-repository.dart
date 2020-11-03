import 'package:med_shield_api/model/app_users.dart';
import 'package:med_shield_new_version/services/repositories/management/cacheConsts.dart';
import 'package:med_shield_new_version/services/repositories/management/hive_object_extras.dart';
import 'package:med_shield_new_version/services/repositories/user/user.dart';

class UserRepo extends ActiveRepo<int, User> {
  @override
  String get boxName => userBoxName;

  Future<User> updateCacheFromApi(AppUsers model) async {
    var local = dataBox.get(model.id, defaultValue: User());
    local.id = model.id;
    local.email = model.email;
    local.name = model.firstNameEn;
    local.start_date = model.startDate;
    local.end_date = model.endDate;
    local.insurance_type = model.insuranceType;
    local.date_of_birth = model.dateOfBirth;
    local.gender = model.gender;
    local.image = model.image;
    local.company_name = model.companyName;
    local.medication = model.medication;
    local.phone = model.mobile;
    local.customer_number = int.tryParse(model.customerNumber);
    await dataBox.put(model.id, local);
    return local;
  }
}
