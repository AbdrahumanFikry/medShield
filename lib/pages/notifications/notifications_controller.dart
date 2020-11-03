import 'package:get/get.dart';
import 'package:med_shield_api/api.dart';
import 'package:med_shield_api/model/notifications.dart';
import 'package:med_shield_api/model/notifications_response.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/utilities/apiUtil.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';

class NotificationsController extends GetxController {
  MedShieldApi get api => Get.find();
  final notifications = RxList<Notifications>([]);

  Future<void> getAllNotifications() async {
    AppService.to.startNewService();
    try {
      NotificationsResponse response =
          await APIUtil.request<NotificationsResponse>(
        future: api.getUserApi().notifications(
              APIUtil.apiToken,
              appUserId: AppService.to.userId,
            ),
      );
      notifications.value = response.result.toList();
      AppService.to.endService();
    } catch (error) {
      AppService.to.endService();
      AppUtil.showAlertDialog(
        body: error.toString().toLowerCase().contains('error')
            ? S.current.formatException
            : error.toString(),
        onConfirm: () {
          Get.back(result: true);
          getAllNotifications();
        },
        confirmText: S.current.retry,
        enableCancel: true,
      );
    }
  }

  @override
  void onInit() {
    getAllNotifications();
  }

  @override
  onClose() {
    AppService.to.endService();
    super.onClose();
  }
}
