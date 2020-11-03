import 'package:get/get.dart';
import 'package:med_shield_new_version/pages/main/main_controller.dart';
import 'package:med_shield_new_version/services/cacheService.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(
        Get.find<CacheService>(),
      ),
    );
  }
}
