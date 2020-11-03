import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_shield_new_version/routes/app_pages.dart';
import 'package:med_shield_new_version/services/appService.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_shield_new_version/utilities/pathUtil.dart';
import 'package:octo_image/octo_image.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.PROFILE),
      child: Container(
        // height: 300.h,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 15.0,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 5.0,
        ),
        decoration: BoxDecoration(
          color: ColorUtil.lightGreyColor,
          borderRadius: AppUtil.borderRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: ColorUtil.lightGreyColor,
                  radius: 85.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(45.0),
                    child: Hero(
                      tag: 'Profile',
                      child: OctoImage(
                        width: 170.w,
                        height: 170.w,
                        image: CachedNetworkImageProvider(
                          AppService.to.user.value?.image ??
                              PathUtil.profileImagePlaceHolder,
                        ),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                          'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                        ),
                        errorBuilder: OctoError.icon(
                          color: Colors.red,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        AppService.to.user?.value?.name ?? '',
                        style: TextStyle(
                          color: ColorUtil.primaryColor,
                          fontSize: 38.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        AppService.to.user?.value?.company_name ?? '',
                        style: TextStyle(
                          color: ColorUtil.secondaryColor,
                          fontSize: 34.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
