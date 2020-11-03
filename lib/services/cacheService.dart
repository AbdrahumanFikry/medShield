import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:med_shield_new_version/services/repositories/approvals/approval-repository.dart';
import 'package:med_shield_new_version/services/repositories/approvals/approval.dart';
import 'package:med_shield_new_version/services/repositories/approvals/approvalComments.dart';
import 'package:med_shield_new_version/services/repositories/approvals/file.dart';
import 'package:med_shield_new_version/services/repositories/favourites/favourite-repository.dart';
import 'package:med_shield_new_version/services/repositories/favourites/favourite.dart';
import 'package:med_shield_new_version/services/repositories/networks/options.dart';
import 'package:med_shield_new_version/services/repositories/networks/selectors-repository.dart';
import 'package:med_shield_new_version/services/repositories/networks/selectors.dart';
import 'package:med_shield_new_version/services/repositories/settingsRepo.dart';
import 'package:med_shield_new_version/services/repositories/user/user-repository.dart';
import 'package:med_shield_new_version/services/repositories/user/user.dart';

class CacheService extends GetxService {
  final SettingsRepo settingsRepo;
  final UserRepo userRepo;
  final FavRepo favRepo;
  final ApprovalRepo approvalRepo;
  final SelectorsRepo selectorsRepo;

  CacheService(
    this.settingsRepo,
    this.userRepo,
    this.favRepo,
    this.approvalRepo,
    this.selectorsRepo,
  );

  static CacheService get to => Get.find();

  Future<String> initRepos() async {
    await Hive.initFlutter('v3');
    await settingsRepo.init();
    await userRepo.init();
    await favRepo.init();
    await approvalRepo.init();
    await selectorsRepo.init();
    return settingsRepo.cachedLang;
  }

  static void registerTypeAdapters() {
    Hive.registerAdapter<User>(UserAdapter());
    Hive.registerAdapter<Favourite>(FavouriteAdapter());
    Hive.registerAdapter<ApprovalDto>(ApprovalDtoAdapter());
    Hive.registerAdapter<FileDto>(FileDtoAdapter());
    Hive.registerAdapter<ApprovalCommentsDto>(ApprovalCommentsDtoAdapter());
    Hive.registerAdapter<Selectors>(SelectorsAdapter());
    Hive.registerAdapter<Options>(OptionsAdapter());
  }
}
