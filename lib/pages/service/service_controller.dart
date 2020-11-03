import 'package:get/get.dart';
import 'package:med_shield_new_version/pages/favorites/favorites_controller.dart';
import 'package:med_shield_new_version/services/repositories/favourites/favourite.dart';

class ServiceController extends GetxController {
  final isFavourite = false.obs;
  final service = Rx<Favourite>();

  Future<void> toggleFavourite() async {
    if (isFavourite.value) {
      bool removed =
          await FavoritesController.to.removeFromFavourite(service.value);
      if (removed) isFavourite.value = false;
    } else {
      bool added = await FavoritesController.to.addToFavourite(service.value);
      if (added) isFavourite.value = true;
    }
  }

  Future<void> checkIfFavourite() async {
    isFavourite.value =
        await FavoritesController.to.checkIfFavourite(service.value.id);
  }

  @override
  void onInit() {
    service.value = Get.arguments;
    checkIfFavourite();
  }
}
