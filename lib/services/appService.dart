import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:med_shield_api/api.dart';
import 'package:med_shield_api/model/approval_response.dart';
import 'package:med_shield_api/model/inline_object2.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/routes/app_pages.dart';
import 'package:med_shield_new_version/services/cacheService.dart';
import 'package:med_shield_new_version/utilities/apiUtil.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';

import 'repositories/user/user.dart';

class AppService extends GetxService {
  static AppService get to => Get.find();
  final loading = false.obs;
  final hasError = false.obs;
  final errorText = ''.obs;
  final user = Rx<User>();
  final fireBaseToken = ''.obs;
  final CacheService cacheController;

  AppService(
    this.cacheController,
  );

  bool get isAuth => userId != null && !userId.isNullOrBlank;

  int get userId => cacheController?.settingsRepo?.cachedUserId;

  MedShieldApi get api => Get.find();

  Future<bool> tryAutoLogin() async {
    var cachedUserId = await cacheController.settingsRepo.cachedUserId;
    if (cachedUserId == null) {
      print('User is not auth!');
      return false;
    }
    User cachedUser = await cacheController.userRepo.getValueById(cachedUserId);
    if (cachedUser == null) {
      print('User is not auth!');
      return false;
    }
    print('User is auth!');
    user.value = cachedUser;
    return true;
  }

  void startNewService() {
    loading.value = true;
    hasError.value = false;
    errorText.value = '';
  }

  void endService() {
    loading.value = false;
    hasError.value = false;
    errorText.value = '';
  }

  void endServiceWithError(String error) {
    loading.value = false;
    hasError.value = true;
    errorText.value = error;
  }

  String validator(
    String value, {
    bool isBirthDay = false,
    bool isMedicalId = false,
    bool isEmail = false,
    bool isPhone = false,
  }) {
    String text = S.current.inputNull;
    if (value == null || value.isEmpty) {
      if (isBirthDay) {
        text = S.current.dateOfBirthNull;
      } else if (isMedicalId) {
        text = S.current.idlNull;
      }
      return text;
    } else if (isEmail && !AppUtil.emailValidatorRegExp.hasMatch(value)) {
      text = S.current.invalidEmail;
      return text;
    } else if (isPhone && value.length < 11) {
      text = S.current.shortPhone;
      return text;
    } else if (isBirthDay && value.length < 10) {
      text = S.current.shortDateOfBirth;
      return text;
    }
    return null;
  }

  Future<void> logOut() async {
    await Hive.deleteFromDisk();
    user.value = null;
    Get.offAllNamed(Routes.SPLASH);
  }

  Future<void> sendPlatformToken() async {
    try {
      if (fireBaseToken != null) {
        print('sending FCM token ... ');
        ApprovalResponse response = await APIUtil.request<ApprovalResponse>(
          future: api.getUserApi().saveToken(
                (InlineObject2Builder()
                      ..platformToken = fireBaseToken.value
                      ..platform = APIUtil.platform
                      ..appUserId = userId ?? 0
                      ..API_TOKEN = APIUtil.apiToken)
                    .build(),
              ),
        );
        print('FCM token sent successfully');
      } else {
        print('FCM token is null!!');
      }
    } catch (error) {
      print(
        'Error sending platform token!! \nError message : ' + error.toString(),
      );
    }
  }
}
