import 'package:get/get.dart';

import 'package:med_shield_new_version/pages/select_language/select_language_controller.dart';
import 'package:med_shield_new_version/services/cacheService.dart';

class SelectLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectLanguageController>(
      () => SelectLanguageController(
        Get.find<CacheService>(),
      ),
    );
  }
}
