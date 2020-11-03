import 'package:get/get.dart';
import 'package:med_shield_new_version/pages/search/search_controller.dart';
import 'package:med_shield_new_version/services/cacheService.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(
      () => SearchController(
        Get.find<CacheService>(),
      ),
    );
  }
}
