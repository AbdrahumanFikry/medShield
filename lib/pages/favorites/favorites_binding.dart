import 'package:get/get.dart';

import 'package:med_shield_new_version/pages/favorites/favorites_controller.dart';
import 'package:med_shield_new_version/services/cacheService.dart';

class FavoritesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoritesController>(
      () => FavoritesController(
        Get.find<CacheService>(),
      ),
    );
  }
}
