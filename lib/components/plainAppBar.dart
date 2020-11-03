import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';

class PlainAppBar extends PreferredSize {
  PlainAppBar({
    String barTitle,
    int trailingCount = 0,
    bool enableBack,
    Widget trailing,
  }) : super(
    child: Padding(
      padding: EdgeInsets.only(
        right: AppUtil.isLtr ? 10.0 : 2.0,
        left: AppUtil.isLtr ? 2.0 : 10.0,
        top: 9.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          enableBack
              ? IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: ColorUtil.primaryColor,
              size: 55.sp,
            ),
            onPressed: () => Get.back(result: true),
          )
              : SizedBox.shrink(),
          const SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: Text(
              barTitle,
              style: TextStyle(
                color: ColorUtil.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 55.sp,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          trailing != null
              ? trailing
              : trailingCount == 0
              ? SizedBox.shrink()
              : CircleAvatar(
            backgroundColor: ColorUtil.primaryColor,
            radius: 12.5,
            child: FittedBox(
              child: Text(
                trailingCount.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    preferredSize: Size(
      Get.width,
      60.0,
    ),
  );
}
