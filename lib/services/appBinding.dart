import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_api/api.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/chat/chat_controller.dart';
import 'package:med_shield_new_version/pages/favorites/favorites_controller.dart';
import 'package:med_shield_new_version/services/FCM.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/services/cacheService.dart';
import 'package:med_shield_new_version/services/repositories/approvals/approval-repository.dart';
import 'package:med_shield_new_version/services/repositories/favourites/favourite-repository.dart';
import 'package:med_shield_new_version/services/repositories/networks/selectors-repository.dart';
import 'package:med_shield_new_version/services/repositories/settingsRepo.dart';
import 'package:med_shield_new_version/services/repositories/user/user-repository.dart';

class InitBinding extends Bindings {
  Future handleFCMMessage(Map<String, dynamic> message) async {
    print('Notification  >>>> ' + message.toString() + '<<<<');
    final item = LiveNotificationItem.fromMap(message);
    if (item.type == TYPE_APPROVAL_COMMENT)
      await CacheService.to.approvalRepo
          .updateStatues(int.tryParse(item.id), statues: Statues.New);
    print('Showing dialog to user!');
    if (Get.currentRoute != '/chat') {
      final result = await Get.snackbar(
        item.notificationTitle,
        item.notificationBody,
        backgroundColor: Colors.white,
        onTap: (GetBar x) async {
          await FirebaseNotifications.navigateToItemDetail(item);
        },
      );
      // AppUtil.showAlertDialog<bool>(
      //     title: item.notificationTitle,
      //     body: item.notificationBody,
      //     confirmText: S.current.done,
      //     onConfirm: () {
      //       Get.back(result: true);
      //     });
      // if (result) {
      //   await FirebaseNotifications.navigateToItemDetail(item);
      // }
    } else {
      ChatController.to.fetchApprovalData(noLoad: true);
    }
  }

  @override
  void dependencies() {
    var userRepo = Get.put(UserRepo());
    var favRepo = Get.put(FavRepo());
    var approvalRepo = Get.put(ApprovalRepo());
    var settingsRepo = Get.put(SettingsRepo());
    var selectorsRepo = Get.put(SelectorsRepo());
    var cacheController = Get.put(
      CacheService(
        settingsRepo,
        userRepo,
        favRepo,
        approvalRepo,
        selectorsRepo,
      ),
    );
    Get.put(
      FirebaseNotifications()
        ..setHandlers(handleFCMMessage, handleFCMMessage, handleFCMMessage)
        ..setGetTokenCallback(
          (token) {
            print("FireBase Token :::: " + token);
          },
        ),
    );
    Get.put<MedShieldApi>(
      MedShieldApi(),
      permanent: true,
    );
    Get.put(
      AppService(
        cacheController,
      ),
    );
    Get.put<FavoritesController>(
      FavoritesController(
        cacheController,
      ),
      permanent: true,
    );
  }
}
