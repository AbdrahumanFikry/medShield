import 'package:get/get.dart';
import 'package:med_shield_new_version/pages/profile/profile_controller.dart';
import 'package:med_shield_new_version/services/cacheService.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(
        cacheController: Get.find<CacheService>(),
      ),
    );
  }
}
