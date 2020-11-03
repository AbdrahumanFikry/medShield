import 'package:get/get.dart';

import 'package:med_shield_new_version/pages/service/service_controller.dart';

class ServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceController>(
      () => ServiceController(),
    );
  }
}
