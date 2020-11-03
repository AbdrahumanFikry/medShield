import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/generated/l10n.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';

class AppButton extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Color textColor;
  final String title;
  final Function onPressed;

  AppButton({
    this.height,
    this.width,
    this.color,
    this.textColor,
    this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        onPressed() ?? Get.back();
      },
      child: Container(
        height: height ?? 110.h,
        width: width ?? Get.width,
        margin: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 15.0,
        ),
        decoration: BoxDecoration(
          color: color ?? ColorUtil.primaryColor,
          borderRadius: AppUtil.borderRadius,
        ),
        child: Center(
          child: Text(
            title ?? S
                .of(context)
                .back,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 40.sp,
            ),
          ),
        ),
      ),
    );
  }
}
