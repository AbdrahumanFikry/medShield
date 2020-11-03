import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/components/appDropDownMenu.dart';
import 'package:med_shield_new_version/components/waiting.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/approval/approval_controller.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApprovalTypesSelector extends GetView<ApprovalController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          controller.typesFetched.value
              ? AppDropDownMenu(
                  listElements: controller.approvalTypes
                          .map((element) => element.name)
                          .toList() ??
                      <String>[],
                  onChanged: (String value) {
                    controller.approvalTypeController.value = value;
                  },
                  hintText: controller.approvalTypeController.value.isEmpty
                      ? S.of(context).approvalType
                      : controller.approvalTypeController.value,
                )
              : Waiting(
                  blockCount: 1,
                ),
          if (controller.approvalTypeHasError)
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 20.0,
              ),
              child: Text(
                AppService.to.errorText.value,
                style: TextStyle(
                  fontSize: 24.sp,
                  color: ColorUtil.errorColor,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
