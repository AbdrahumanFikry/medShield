import 'package:get/get.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/services/cacheService.dart';
import 'package:med_shield_new_version/services/repositories/favourites/favourite.dart';

class FavoritesController extends GetxController {
  final allFavourites = RxList<Favourite>([]);
  final CacheService cacheController;

  static FavoritesController get to => Get.find();

  FavoritesController(
    this.cacheController,
  );

  Future<void> fetchAllFavourite() async {
    AppService.to.startNewService();
    try {
      allFavourites.value = await cacheController.favRepo.getAllValues();
    } catch (error) {
      allFavourites.value = [];
    }
    AppService.to.endService();
  }

  Future<bool> addToFavourite(Favourite model) async {
    try {
      Favourite favourite =
          await cacheController.favRepo.addToFavourites(model);
      if (favourite != null) {
        await fetchAllFavourite();
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  Future<bool> removeFromFavourite(Favourite model) async {
    try {
      bool removed = await cacheController.favRepo.removeFromFavourites(model);
      if (removed) {
        await fetchAllFavourite();
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  Future<bool> checkIfFavourite(int id) async {
    try {
      await fetchAllFavourite();
      int index = allFavourites.indexWhere((fav) => fav.id == id);
      if (index == -1 || index.isNullOrBlank) {
        return false;
      } else {
        return true;
      }
    } catch (error) {
      return false;
    }
  }

  @override
  void onInit() {
    fetchAllFavourite();
  }
}
