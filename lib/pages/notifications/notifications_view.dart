import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/components/AnimatedListHandler.dart';
import 'package:med_shield_new_version/components/appDirectionality.dart';
import 'package:med_shield_new_version/components/emptyScreen.dart';
import 'package:med_shield_new_version/components/loading.dart';
import 'package:med_shield_new_version/components/plainAppBar.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/notifications/components/notificationCard.dart';
import 'package:med_shield_new_version/pages/notifications/notifications_controller.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';

class NotificationsView extends GetView<NotificationsController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppDirectionality(
        child: Scaffold(
          appBar: PlainAppBar(
            barTitle: S.of(context).notifications,
            enableBack: true,
            trailingCount: 0,
          ),
          body: RefreshIndicator(
            onRefresh: () async => await controller.getAllNotifications(),
            backgroundColor: ColorUtil.primaryColor,
            child: Obx(
              () => AppService.to.loading.value
                  ? Loading()
                  : controller.notifications?.length == 0
                      ? EmptyScreen(
                          contentName: S.of(context).notifications,
                          type: EmptyType.isNotification,
                        )
                      : AnimatedListHandler(
                          children: controller.notifications
                              .map(
                                (singleNotification) => NotificationCard(
                                  title: singleNotification.title,
                                  date: singleNotification.addDate,
                                  subTitle: singleNotification.body,
                                ),
                              )
                              .toList(),
                        ),
            ),
          ),
        ),
      ),
    );
  }
}
