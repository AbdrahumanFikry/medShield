import 'package:get/get.dart';
import 'package:med_shield_new_version/services/cacheService.dart';

class SettingsController extends GetxController {
  final CacheService cacheService;

  SettingsController(
    this.cacheService,
  );

  bool get isAr => cacheService.settingsRepo.cachedLang == 'ar';
}
