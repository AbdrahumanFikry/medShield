import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/pages/auth/auth_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';

class BirthDateBlock extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: AppService.to.loading.value
                ? () {}
                : () async {
                    controller.birthDate.value = await AppUtil.chooseDateTime(
                      mode: CupertinoDatePickerMode.date,
                    );
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 20.h,
                horizontal: 10.0,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              decoration: BoxDecoration(
                borderRadius: AppUtil.borderRadius,
                border: Border.all(
                  color: controller.birthDateHasError
                      ? ColorUtil.errorColor
                      : ColorUtil.mediumGreyColor,
                  width: controller.birthDateHasError ? 1.0 : 0.5,
                ),
              ),
              height: 50.0,
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      controller.birthDate.value.isNullOrBlank
                          ? S.of(context).birthDate
                          : DateFormat.yMd().format(controller.birthDate.value),
                      style: TextStyle(
                        fontSize: 32.sp,
                        color: ColorUtil.greyColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    FontAwesomeIcons.calendarAlt,
                    color: ColorUtil.greyColor,
                    size: 50.sp,
                  ),
                ],
              ),
            ),
          ),
          if (controller.birthDateHasError)
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
