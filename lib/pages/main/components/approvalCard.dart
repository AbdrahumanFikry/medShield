import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:med_shield_new_version/routes/app_pages.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApprovalCard extends StatelessWidget {
  final int id;
  final bool isNew;
  final String title;
  final String subTitle;
  final DateTime date;

  ApprovalCard({
    this.isNew = true,
    this.title,
    this.id,
    this.subTitle,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.CHAT, arguments: id),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title ?? '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 38.sp,
                      fontWeight: isNew ? FontWeight.bold : FontWeight.w200,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    subTitle ?? '',
                    style: TextStyle(
                      color: ColorUtil.greyColor,
                      fontSize: 32.sp,
                      fontWeight: isNew ? FontWeight.bold : FontWeight.w200,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                isNew
                    ? CircleAvatar(
                        radius: 5.0,
                        backgroundColor: ColorUtil.primaryColor,
                      )
                    : SizedBox.shrink(),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  DateFormat.yMMMd().format(date),
                  style: TextStyle(
                    color: ColorUtil.greyColor,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w200,
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
