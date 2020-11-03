import 'package:get/get.dart';
import 'package:med_shield_new_version/pages/approval/approval_controller.dart';
import 'package:med_shield_new_version/services/cacheService.dart';

class ApprovalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApprovalController>(
      () => ApprovalController(
        Get.find<CacheService>(),
      ),
    );
  }
}
