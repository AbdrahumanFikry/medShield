import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:med_shield_api/api.dart';
import 'package:med_shield_api/model/inline_object1.dart';
import 'package:med_shield_api/model/user_login_response.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/routes/app_pages.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/services/cacheService.dart';
import 'package:med_shield_new_version/utilities/apiUtil.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';

class AuthController extends GetxController {
  TextEditingController medicalId = TextEditingController();
  GlobalKey<FormState> authFormKey = GlobalKey<FormState>();
  final birthDate = Rx<DateTime>();
  final CacheService cacheController;

  AuthController(
    this.cacheController,
  );

  MedShieldApi get api => Get.find();

  bool get birthDateHasError =>
      birthDate.value == null && AppService.to.hasError.value;

  Future<void> auth() async {
    final formData = authFormKey.currentState;
    if (formData.validate() && birthDate.value != null) {
      formData.save();
      AppService.to.startNewService();
      print('MedicalId : ' + medicalId.text);
      print(
        'BirthDate : ' + DateFormat('MM/dd/yyyy', 'en').format(birthDate.value),
      );
      try {
        UserLoginResponse response = await APIUtil.request<UserLoginResponse>(
          future: api.getUserApi().login(
                (InlineObject1Builder()
                      ..API_TOKEN = APIUtil.apiToken
                      ..customerNumber = medicalId.text
                      ..dateOfBirth =
                          DateFormat('MM/dd/yyyy', 'en').format(birthDate.value)
                      ..platform = APIUtil.platform
                      ..platformToken = AppService.to.fireBaseToken.value ?? '')
                    .build(),
              ),
        );
        await cacheController.settingsRepo.setCachedUserId(response.result.id);
        var user =
            await cacheController.userRepo.updateCacheFromApi(response.result);
        AppService.to.user.value = user;
        Get.offNamed(Routes.MAIN);
      } catch (error) {
        AppUtil.showAlertDialog(body: error.toString());
      }
      AppService.to.endService();
    } else if (birthDate.value == null) {
      AppService.to.endServiceWithError(S.current.dateOfBirthNull);
    }
  }

  @override
  void onInit() {
    medicalId.clear();
    birthDate.value = null;
  }

  @override
  onClose() {
    AppService.to.endService();
    medicalId.clear();
    birthDate.value = null;
    super.onClose();
  }
}
