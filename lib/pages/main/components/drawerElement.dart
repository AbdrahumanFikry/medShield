import 'package:flutter/material.dart';
import 'package:med_shield_new_version/utilities/appUtil.dart';
import 'package:med_shield_new_version/utilities/colorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerElement extends StatelessWidget {
  final Function onTab;
  final IconData iconData;
  final String title;
  final Widget trailing;

  DrawerElement({
    this.title,
    this.iconData,
    this.trailing,
    this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppUtil.borderRadius,
          color: ColorUtil.lightGreyColor,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 30.0,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 5.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconData,
              color: ColorUtil.greyColor,
              size: 50.sp,
            ),
            const SizedBox(
              width: 25.0,
            ),
            Text(
              title,
              style: TextStyle(
                color: ColorUtil.primaryColor,
                fontSize: 40.sp,
              ),
              maxLines: 1,
            ),
            Spacer(),
            trailing ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
