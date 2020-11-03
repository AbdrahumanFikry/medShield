import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/components/appButton.dart';
import 'package:med_shield_new_version/components/appDirectionality.dart';
import 'package:med_shield_new_version/components/appInputField.dart';
import 'package:med_shield_new_version/components/loading.dart';
import 'package:med_shield_new_version/components/plainAppBar.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/approval/approval_controller.dart';
import 'package:med_shield_new_version/pages/approval/components/approvalTypes.dart';
import 'package:med_shield_new_version/pages/approval/components/attachFile.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApprovalView extends GetView<ApprovalController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppDirectionality(
        child: Scaffold(
          appBar: PlainAppBar(
            barTitle: S.of(context).approval,
            enableBack: true,
          ),
          body: Form(
            key: controller.approvalFormKey,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Text(
                    S.of(context).getApproval,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: ColorUtil.secondaryColor,
                      fontSize: 36.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                AppInputField(
                  controller: controller.emailController,
                  hintText: S.of(context).email,
                  loading: AppService.to.loading.value,
                  validator: (String value) => AppService.to.validator(
                    value,
                    isEmail: true,
                  ),
                ),
                AppInputField(
                  controller: controller.titleController,
                  hintText: S.of(context).address,
                  loading: AppService.to.loading.value,
                  validator: AppService.to.validator,
                ),
                ApprovalTypesSelector(),
                AppInputField(
                  controller: controller.detailsController,
                  hintText: S.of(context).moreDetails,
                  loading: AppService.to.loading.value,
                ),
                AttachFile(),
                Obx(
                  () => AppService.to.loading.value
                      ? Loading()
                      : AppButton(
                          title: S.of(context).send,
                          onPressed: () async {
                            await controller.getApproval();
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
