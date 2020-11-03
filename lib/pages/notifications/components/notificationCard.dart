import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationCard extends StatelessWidget {
  final bool isNew;
  final String title;
  final String subTitle;
  final String date;

  NotificationCard({
    this.isNew = false,
    this.title = '',
    this.subTitle = '',
    this.date = '',
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        color: isNew ? Colors.transparent : ColorUtil.lightGreyColor,
        padding: EdgeInsets.only(
          right: AppUtil.isLtr ? 10.0 : 0.0,
          left: AppUtil.isLtr ? 0.0 : 10.0,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 5.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            isNew
                ? const SizedBox(
                    height: 50.0,
                  )
                : Container(
                    height: 170.h,
                    width: 5.0,
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                      borderRadius: AppUtil.customBorderRadius,
                    ),
                  ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.h,
                horizontal: 25.w,
              ),
              child: Icon(
                FontAwesomeIcons.bell,
                color: ColorUtil.secondaryColor,
                size: 75.sp,
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 38.sp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ),
                      Text(
                        date,
                        style: TextStyle(
                          color: ColorUtil.greyColor,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      color: ColorUtil.greyColor,
                      fontSize: 34.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
