import 'package:get/get.dart';
import 'package:med_shield_new_version/pages/settings/settings_controller.dart';
import 'package:med_shield_new_version/services/cacheService.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(
      () => SettingsController(
        Get.find<CacheService>(),
      ),
    );
  }
}
