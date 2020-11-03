import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/components/appButton.dart';
import 'package:med_shield_new_version/components/appDirectionality.dart';
import 'package:med_shield_new_version/components/appInputField.dart';
import 'package:med_shield_new_version/components/loading.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/auth/auth_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_shield_new_version/pages/auth/components/BirthDateBlock.dart';
import 'package:med_shield_new_version/routes/app_pages.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:med_shield_new_version/utilities/pathUtil.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppDirectionality(
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: Get.height -
                  Get.mediaQuery.padding.top -
                  Get.mediaQuery.padding.bottom,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: 175.h,
                      bottom: 75.h,
                    ),
                    child: Image.asset(
                      PathUtil.logoPath,
                      // height: 200.h,
                      width: 550.w,
                    ),
                  ),
                  Form(
                    key: controller.authFormKey,
                    child: Obx(
                      () => AppInputField(
                        maxLines: 1,
                        loading: AppService.to.loading.value,
                        hintText: S.of(context).medicalIdNumber,
                        controller: controller.medicalId,
                        validator: (String value) => AppService.to.validator(
                          value,
                          isMedicalId: true,
                        ),
                      ),
                    ),
                  ),
                  BirthDateBlock(),
                  Spacer(),
                  Obx(
                    () => AppService.to.loading.value
                        ? Loading()
                        : AppButton(
                            title: S.of(context).signIn,
                            onPressed: () async {
                              await controller.auth();
                            },
                          ),
                  ),
                  GestureDetector(
                    onTap: () => Get.offNamed(
                      Routes.MAIN,
                    ),
                    child: Text(
                      S.of(context).guest,
                      style: TextStyle(
                        color: ColorUtil.primaryColor,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
