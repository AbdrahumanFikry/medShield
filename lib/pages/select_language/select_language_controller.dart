import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/routes/app_pages.dart';
import 'package:med_shield_new_version/services/cacheService.dart';

class SelectLanguageController extends GetxController {
  final CacheService cacheService;
  final refreshApp = false.obs;

  SelectLanguageController(
    this.cacheService,
  );

  Future<void> changeLanguage({String languageCode}) async {
    await S.load(Locale(languageCode));
    await cacheService.settingsRepo.setCachedLang(languageCode);
    if (refreshApp.value) {
      Get.offAllNamed(Routes.SPLASH);
    } else {
      Get.offNamed(Routes.AUTH);
    }
  }

  @override
  void onInit() {
    refreshApp.value = Get.arguments ?? false;
    super.onInit();
  }
}
