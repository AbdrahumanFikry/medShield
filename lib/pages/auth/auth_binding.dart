import 'package:get/get.dart';

import 'package:med_shield_new_version/pages/auth/auth_controller.dart';
import 'package:med_shield_new_version/services/cacheService.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(
        Get.find<CacheService>(),
      ),
    );
  }
}
