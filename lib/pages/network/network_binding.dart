import 'package:get/get.dart';

import 'package:med_shield_new_version/pages/network/network_controller.dart';
import 'package:med_shield_new_version/services/cacheService.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(
      () => NetworkController(
        Get.find<CacheService>(),
      ),
    );
  }
}
