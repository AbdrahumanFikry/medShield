import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/components/AnimatedListHandler.dart';
import 'package:med_shield_new_version/components/emptyScreen.dart';
import 'package:med_shield_new_version/components/waiting.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/main/components/approvalCard.dart';
import 'package:med_shield_new_version/pages/main/main_controller.dart';
import 'package:med_shield_new_version/routes/app_pages.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => await controller.getAllApprovals(),
        color: Colors.white,
        backgroundColor: ColorUtil.primaryColor,
        child: Obx(
          () => controller.mainLoading.value
              ? Waiting(
                  blockCount: 4,
                )
              : controller.allApprovals.isEmpty
                  ? EmptyScreen(
                      contentName: S.current.approval,
                    )
                  : AnimatedListHandler(
                      children: controller.allApprovals
                          .map(
                            (approval) => ApprovalCard(
                              id: approval.id,
                              title: approval.title,
                              subTitle: approval.more_details,
                              date: approval.updatedAt,
                              isNew: approval.statues == 'new',
                            ),
                          )
                          .toList()),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorUtil.primaryColor,
        elevation: 2.0,
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: Text(
          S.of(context).addApproval,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.sp,
          ),
        ),
        onPressed: () {
          if (AppService.to.isAuth) {
            Get.toNamed(Routes.APPROVAL);
          } else {
            AppUtil.showAlertDialog(
              title: S.current.alert,
              confirmText: S.current.signIn,
              body: S.current.notAuth,
              enableCancel: true,
              onConfirm: () {
                Get.offAllNamed(Routes.AUTH);
              },
            );
          }
        },
      ),
    );
  }
}
