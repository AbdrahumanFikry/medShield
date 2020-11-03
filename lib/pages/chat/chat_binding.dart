import 'package:get/get.dart';

import 'package:med_shield_new_version/pages/chat/chat_controller.dart';
import 'package:med_shield_new_version/services/cacheService.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChatController(Get.arguments, Get.find<CacheService>()));
  }
}
